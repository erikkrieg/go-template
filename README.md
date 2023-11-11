# Go Template

Template for Nix-based Go projects

## Setup

### Nix (required)

Nix is used as a package manager for this project and supports building binaries as well as configuring a [development environment](https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-develop.html?highlight=nix%20develop#examples). This development environment will include the version of Go specified by the project as well as any additional tooling used by the project.

Install Nix:

- [Standard installation](https://nixos.org/download)
- [A community installer](https://github.com/DeterminateSystems/nix-installer)
  - Promises more reliable installations for MacOS

### Direnv (recommended)

`direnv` is an extension for your shell. It augments existing shells with a new feature that can load and unload environment variables depending on the current directory.

This project uses it to automatically create a Nix-based development shell when working from a directory of this project.

Install Direnv:

- [Standard installation](https://direnv.net/docs/installation.html)

## Development environment

With `direnv` installed, you will be prompted to run `direnv allow` when changing into the project directory for the first time. After running the command, you should automatically start a development shell using your default shell.

If you do not wish to use direnv, you can manually start the dev shell with:

- `nix develop`

This will create a `bash` shell by default. If you'd prefer to use a different shell, you can instead run:

- `nix develop --command zsh`
