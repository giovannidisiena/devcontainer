# Giovanni Di Siena's Dev Container
Forked from The Red Guild's [Where do you run your code? - an intro to devcontainers](https://blog.theredguild.org/where-do-you-run-your-code/).

## Requirements
Must have `docker` and `docker-buildx` installed on local OS.

### Visual Studio Code
1. DevContainer extension by MS: `ms-vscode-remote.remote-containers`.

### VSCodium
1. [DevPod Containers extension](https://open-vsx.org/extension/3timeslazy/vscodium-devpodcontainers).
2. [DevPod CLI](https://devpod.sh/docs/getting-started/install#optional-install-devpod-cli).

## Kick-off
1. Start the docker service, and make sure your user is in the `docker` group;
   otherwise, log back in again.
2. Clone this repo and open the folder with vscode/vscodium:
   `code .` or `codium .`.
3. Select _"Reopen in Container"_ and wait. This will build the container volume.
4. If this is your first time, you'll be prompted to press enter on a console
   log that triggers the terminal.
5. If not you can go to the extensions section on your side, click the Remote
   Explorer tab and select the active devcontainer.

## Usage
If you open the Command Palette (`Ctrl+Shift+P` or whatever your shortcut is) you
 can access several features:
- You can attach VS Code/Codium to a running container, where you can open any folder
 or Clone a repository.
- You can open new folders or workspaces of your liking inside the current 
volume.
- You can even clone a new repository in a new volume based on the same
 devcontainer.

## What's in it?
- frameworks: foundry, hardhat (manual install)
- utilities: brew, crytic-compile, solc-select
- fuzzing: echidna, medusa
- static analysis: aderyn, slither
- others: node, npm, pnpm, yarn, python, go
- terminal: zsh with oh-my-zsh
- extensions:
   - `GitHub.copilot`,
   - `NomicFoundation.hardhat-solidity`,
   - `tintinweb.vscode-inline-bookmarks`,
   - `tintinweb.vscode-solidity-language`,
   - `tintinweb.vscode-circom-pro`,
   - `rust-lang.rust-analyzer`

## Useful resources
### Install different node versions with nvm
```bash
# Install the latest version
nvm install --lts
# Install version 14
nvm install 14
# Use a specific version
nvm use 12.22.7
# List current installations
nvm ls
```

### Install Hardhat
Hardhat does not come by default, since the official documentation states
that you should install it locally on the working repository with `npx`.

If you wish to install hardhat globally, you can run:
`pnpm install hardhat` wherever you want.

The other reason it does not come by default, it's because the nvm
installation is not trivial at all, and working with its peculiarities
inside a Dockerfile to install packages is not worth the mess.
