# Giovanni Di Siena's Dev Container
Forked from The Red Guild's [Where do you run your code? - an intro to devcontainers](https://blog.theredguild.org/where-do-you-run-your-code/). Additionally inspired by Cyfrin's [Web3 Dev Containers](https://github.com/Cyfrin/web3-dev-containers/tree/main). Always a work in progress.

## Table of Contents
- [Requirements](#requirements)
   - [Visual Studio Code Requirements](#visual-studio-code-requirements)
   - [VSCodium Requirements](#vscodium-requirements)
- [Installation](#installation)
- [Quickstart](#quickstart)
- [Features Overview](#features-overview)
   - [Extensions](#extensions)
   - [Frameworks](#frameworks)
   - [Security Tools](#security-tools)
   - [Utilities](#utilities)
   - [Languages](#languages)
   - [Shell](#shell)
   - [Additional Repositories](#additional-repositories)
   - [Notes](#notes)

## Requirements
- [Docker](https://docs.docker.com/get-docker/)
   - Must have `docker` and `docker-buildx` installed.

### Visual Studio Code Requirements
- [VSCode](https://code.visualstudio.com/).
- DevContainer extension by MS: `ms-vscode-remote.remote-containers`.

### VSCodium Requirements
- [DevPod Containers extension](https://open-vsx.org/extension/3timeslazy/vscodium-devpodcontainers).
- [DevPod CLI](https://devpod.sh/docs/getting-started/install#optional-install-devpod-cli).

## Installation
```bash
git clone https://github.com/giovannidisiena/devcontainer
cd $_
```

## Quickstart
1. Start the docker service, and make sure your user is in the `docker` group;
   otherwise, add it and log back in again.
2. Clone this repo and open the directory with vscode/vscodium:
   `code .` or `codium .`.
3. Run `Dev Containers: Reopen in Container` from the command palette (`Cmd+Shift+P`) to build the container volume. Alternatively, execute `docker build -t devcontainer .`.
4. If this is your first time, you'll be prompted to press enter on a console
   log that triggers the terminal.
5. If not, click the Remote Explorer tab and select the active devcontainer.
6. Several features can now be accessed, including:
   - Attaching VS Code/Codium to a running container.
   - Opening new folders or workspaces inside the current volume.
   - Cloning a new repository in a new volume based on the same devcontainer.

## Features Overview

### Extensions

- GitHub.copilot
- NomicFoundation.hardhat-solidity
- tintinweb.vscode-inline-bookmarks
- tintinweb.vscode-solidity-language
- tintinweb.vscode-circom-pro
- "tintinweb.vscode-vyper
- "ms-python.python"
- rust-lang.rust-analyzer

### Frameworks
- **Foundry**: Blazing fast modular toolkit (forge, anvil, cast).
- **Hardhat**: Dev environment to develop, deploy, test and debug.
- **Moccasin**: Smart contract development framework for Vyper.

### Security Tools
- **Fuzzing**:
  - **Medusa**: Parallelized, coverage-guided, mutational Solidity smart contract fuzzing, powered by go-ethereum.
  - **Echidna**: Fuzz testing for Ethereum contracts (prebuilt binary).
  - **ityfuzz**: Ethereum fuzzing tool for contract vulnerabilities.

- **Static Analysis**:
  - **Slither**: Static analysis for Solidity and Vyper.
    - **Slitherin**: Slither detectors.
  - **Semgrep**: Lightweight static analysis with custom rule definitions.

- **Symbolic execution**:
  - **Halmos**: A symbolic testing tool for EVM smart contracts.
 
- **Other**:
  - **Heimdall**: An advanced EVM smart contract toolkit specializing in bytecode analysis and
    extracting information from unverified contracts.
  - **Aderyn**: Rust-based Solidity AST analyzer.

### Utilities
- **solc-select**: Solc version manager for multiple Solidity versions.
- **vyper**: Pythonic language for Ethereum smart contracts.
- **Package Managers**:
  - **asdf**: Multiple runtime version manager.
  - **npm**, **pnpm**, **yarn**: JavaScript package managers.
  - **pipx**: Isolated Python package manager.
  - **cargo**: Rust package manager.
  - **uv**: Utility manager.
  - **nvm**: Node.js version manager.


### Languages
- **JavaScript**, **Python**, **Go**, **Rust**, **Vyper**, **Solidity**.

### Shell
**ZSH**. Configured with Oh-My-ZSH and autocompletions for: **medusa**, **anvil**, **cast**, **forge**.

### Additional Repositories
- **audit-repo-cloner**: Clone repositories for Cyfrin audits.

### Notes
- Remember to disable telemetry. `Ctrl+Shift+P > Open Settings (UI) >` type `telemetry` and uncheck
all the boxes. Alternatively you can add them directly by going to `Open Settings (JSON)`, example:
```json
  "telemetry.telemetryLevel": "off",
  "gitlens.telemetry.enabled": false,
  "partialDiff.enableTelemetry": false,
  ```
