# Base debian build (latest).
FROM mcr.microsoft.com/vscode/devcontainers/base:debian

# Update packages.
RUN apt-get update

# Install pipx
RUN apt-get install -y pipx

# Set the default shell to zsh
ENV SHELL=/usr/bin/zsh

# Running everything under zsh
SHELL ["/usr/bin/zsh", "-c"]

# Dropping privileges
USER vscode

# Install golang's latest version through asdf
RUN git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.14.0 \
    && echo '. $HOME/.asdf/asdf.sh' >> $HOME/.zshrc \
    && echo 'fpath=(${ASDF_DIR}/completions $fpath)' >> $HOME/.zshrc \
    && echo 'autoload -Uz compinit && compinit' >> $HOME/.zshrc \
    && . $HOME/.asdf/asdf.sh \
    && asdf plugin add golang \
    && asdf install golang latest

# Install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && source $HOME/.cargo/env

# Install nvm, yarn, npm, pnpm
RUN curl -o- https://raw.githubusercontent.com/devcontainers/features/main/src/node/install.sh | sudo zsh

# Install solc-select
RUN pipx install solc-select

# Install slither
RUN pipx install slither-analyzer

# Install crytic-compile
RUN pipx install crytic-compile

# Install homebrew
RUN curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | zsh

# Install echidna
RUN brew install echidna

# Install medusa
RUN brew install medusa

# Install aderyn
RUN curl -L https://raw.githubusercontent.com/Cyfrin/aderyn/dev/cyfrinup/install | zsh
RUN cyfrinup

# Foundry framework
RUN curl -L https://foundry.paradigm.xyz | zsh
RUN foundryup

# Clone audit-repo-cloner
RUN git clone https://github.com/Cyfrin/audit-repo-cloner.git /usr/local/src/audit-repo-cloner
RUN python3 -m venv /usr/local/src/audit-repo-cloner/venv \
    && . /usr/local/src/audit-repo-cloner/venv/bin/activate \
    && pip install --upgrade pip \
    && pip install -r /usr/local/src/audit-repo-cloner/requirements.txt

# Clean up
RUN sudo apt-get autoremove -y && sudo apt-get clean -y

