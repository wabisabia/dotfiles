# Jumpstart

This repository contains configuration for:

|Program                                                          |Purpose             |Configuration          |
|---                                                              |---                 |---                    |
|[`fish`](https://fishshell.com/)                                 |shell               |`.config/fish`         |
|[`starship`](https://starship.rs/installing/)                    |shell prompt        |`.config/starship.toml`|
|[`nvim`](https://github.com/neovim/neovim/blob/master/INSTALL.md)|modal text-editor   |`.config/nvim`         |
|[`tmux`](https://github.com/tmux/tmux/wiki/Installing)           |terminal multiplexer|`.tmux.conf`           |
|[`git`](https://git-scm.com/downloads)                           |`git` client        |`.gitconfig`           |

Some configuration relies on:

|Program                                                                       |Purpose          |Use                                                  |
|---                                                                           |---              |---                                                  |
|[`eza`](https://github.com/eza-community/eza?tab=readme-ov-file#installation) |list files       |`.config/fish/config.fish`: alias `ls`               |
|[`delta`](https://dandavison.github.io/delta/installation.html)               |`git`-diff viewer|`.gitconfig`: diff viewer                            |
|[`fd`](https://github.com/sharkdp/fd?tab=readme-ov-file#installation)         |find files       |`fzf.fish`, `nvim-telescope`, ...                    |
|[`rg`](https://github.com/BurntSushi/ripgrep/?tab=readme-ov-file#installation)|find text        |`fzf.fish`, `nvim`'s `grepprg`, `nvim-telescope`, ...|
|[`fzf`](https://github.com/junegunn/fzf?tab=readme-ov-file#installation)      |fuzzy finder     |`fzf.fish`, `nvim-telescope`, ...                    |

Other recommended programs:

|Program                                                                            |Purpose         |
|---                                                                                |---             |
|[`bat`](https://github.com/sharkdp/bat?tab=readme-ov-file#installation)            |text-file viewer|
|[`sd`](https://github.com/chmln/sd?tab=readme-ov-file#installation)                |text-replacer   |
|[`hyperfine`](https://github.com/sharkdp/hyperfine?tab=readme-ov-file#installation)|program timer   |
