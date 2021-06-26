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

| File            | Purpose                                                                                                                                                                       |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Brewfile`      | A list of things to be installed using [Homebrew](https://brew.sh/)                                                                                                           |
| `alexrc`        | Configuration for [`alex`](https://github.com/get-alex/alex), the considerate writing tool.                                                                                   |
| `aliases.zsh`   | Command aliases that work in `zsh` but may not be safe for other shells.                                                                                                      |
| `ctags`         | Configuration for the `ctags` indexing tool.                                                                                                                                  |
| `functions.zsh` | Function definitions useful in `zsh` that may not be safe for other shells.                                                                                                   |
| `gitconfig`     | Configuration to provide convenience methods when using `git` on the command line. Supports an untracked `~/.gitconfig.local` file to avoid committing sensitive information. |
| `hushlogin`     | Tells macOS not to include Last Login messages on shell startup.                                                                                                              |
| `pystartup`     | Configuration for Python startup, namely to enable readline capabilities from previous sessions along with tab completion.                                                    |
| `ripgreprc`     | Configuration for [`ack`](https://linux.die.net/man/1/ack). Ignores several common generated output directory patterns.                                                       |
| `screenrc`      | Configuration for [`screen`](https://www.gnu.org/software/screen/) status line.                                                                                               |
| `starship.toml` | Configuration for [Starship](https://starship.rs/) command prompts.                                                                                                           |
| `vimrc`         | Configuration to improve the user experience of [Vim](https://www.vim.org/). No fancy macros, just good highlighting and native settings along with some position history.    |
| `zshrc`         | Configuration settings for making `zsh` even more awesome.                                                                                                                    |
| `zprofile`      | Environment changes during startup.                                                                                                                                           |
