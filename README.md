# dotfiles

Common configuration files and handy scripts to use when setting up or improving a shell environment.

## Installation
```shell
$ git clone https://github.com/daneah/dotfiles
$ cd dotfiles
$ git submodule update --init --recursive
$ ./install.zsh
```

## Configuration Files

### `ackrc`

Configuration for `ack`.
Ignores several common generated output directory patterns.

### `aliases.zsh`

Command aliases that work in `zsh` but may not be safe for other shells.

### `brew`

A list of things to be installed using Homebrew

### `functions.zsh`

Function definitions useful in `zsh` that may not be safe for other shells.

### `gitconfig`

Configuration to provide convenience methods when using `git` on the command line.
Supports an untracked `~/.gitconfig.local` file to avoid committing sensitive information

### `hushlogin`

Tells macOS not to include Last Login messages on shell startup.

### `npmrc`

Configuration for `npm`, namely the directory for global installations.

### `pystartup`

Configuration for Python startup, namely to enable readline capabilities from previous sessions.

### `rvmrc`

Configuration for RVM, namely to set autoupdating

### `screenrc`

Configuration for `screen` status line

### `vimrc`

Configuration to improve the user experience of `VIM`. No fancy macros, just good highlighting and native settings along with some position history.

### `zshrc`

Configuration, aliases, functions, and settings for making `zsh` even more awesome.
