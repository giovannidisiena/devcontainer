# syntax=docker/dockerfile:1.8
# check=error=true

# Grab at least python 3.12
FROM python:3.12-slim as python-base

# Base debian build (latest).
FROM mcr.microsoft.com/vscode/devcontainers/base:debian

# Switch to root (the default might be root anyway)
USER root

COPY --from=python-base /usr/local /usr/local

# Super basic stuff to get everything started
RUN apt-get update -y && apt-get install -y \
    zsh python3-dev libpython3-dev build-essential vim curl git sudo pkg-config \
    --no-install-recommends

# The base container usually has a “vscode” user. If not, create one here.
RUN echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to vscode (drop privs)
USER vscode
WORKDIR /home/vscode

# Set HOME and create workspace folder
ENV HOME=/home/vscode
RUN mkdir -p ${HOME}/workspace && chown vscode:vscode ${HOME}/workspace

# Set neded paths (for python, pix, pnpm)
ENV USR_LOCAL_BIN=/usr/local/bin
ENV LOCAL_BIN=${HOME}/.local/bin
ENV PNPM_HOME=${HOME}/.local/share/pnpm
ENV PATH=${PATH}:${USR_LOCAL_BIN}:${LOCAL_BIN}:${PNPM_HOME}

# Install pipx
RUN python3 -m pip install --no-cache-dir --upgrade pipx

# Make sure pipx's paths are set
RUN pipx ensurepath

# Set the default shell to zsh
ENV SHELL=/usr/bin/zsh

# Running everything under zsh
SHELL ["/usr/bin/zsh", "-ic"]


## Install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && source $HOME/.cargo/env

USER root
## Install nvm, yarn, npm, pnpm
RUN curl -o- https://raw.githubusercontent.com/devcontainers/features/main/src/node/install.sh | bash
USER vscode

RUN pnpm install hardhat -g

# Python installations
# Install slither-analyzer, crytic-compile, solc-select, vyper, semgrep, and solc
RUN pipx install crytic-compile && \
    pipx install solc-select && \
    pipx install vyper && \
    solc-select install latest && solc-select use latest

### Install uv, and then the latest version of halmos and moccasin
RUN curl -fsSL https://astral.sh/uv/install.sh | bash && \
    uv tool install halmos && \
    uv tool install moccasin

# Fetch and install setups
## Foundry framework
RUN curl -fsSL https://foundry.paradigm.xyz | zsh
RUN foundryup

# Git clone, compile kind of installations
# Clone useful repositories inside workspace
WORKDIR ${HOME}/workspace
RUN git clone --depth 1 https://github.com/Cyfrin/audit-repo-cloner.git

# Back to home in case we want to do something later.
WORKDIR ${HOME}

# Do some things as root
USER root

## Add completions for anvil, cast, forge.
RUN mkdir -p /usr/share/zsh/site-functions && \
    for tool in anvil cast forge; do \
        "$tool" completions zsh > /usr/share/zsh/site-functions/_$tool; \
    done

## Clean
RUN apt-get autoremove -y && apt-get clean -y

## Configure MOTD
COPY --link --chown=root:root motd /etc/motd
RUN echo '\ncat /etc/motd\n' >> ~/.zshrc

## back to user!
USER vscode

# Example HEALTHCHECK, we don't need once since we're not using services. If you add services in the future, you would need to add "something" like this:
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 CMD \
  zsh -c 'command -v solc && echo "OK" || exit 1'