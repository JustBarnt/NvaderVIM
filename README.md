# A Neovim Plugin Template

![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)

My personal Nvim Distro

## Installing it

Via `git`:

*RECOMENDATION*
Install via Unix/WSL if would want to take advantage of Neorg.
Getting the parsers to install on Windows is an absolute nightmare.

```bash
# Windows
git clone https://github.com/justbarnt/justnvim ~/AppData/Local/nvim/

# Unix
git clone https://github.com/justbarnt/justnvim ~/.config/nvim/

```
### Neorg
Neorg is a Neovim implementation of OrgMode from Emacs. Using Neorg on windows has a few caveats.
From my experience it seems the treesitter parser for `.norg` files only successfully builds when I am in a `.norg` file
and I run `:Neorg sync-parsers`. If I try to run that command outside of `.norg` file the `Norg` parser builds incorrectly.
> This doesn't appear to be an issue on linux?

### Recommened Windows Packages
- [llvm, clangd] or gcc and mingw (All Compliler related for Tree-Sitter)
- fd, ripgrep: fd is blazingly fast `find`, ripgrep is a blazingly fast regex search utility. Telescope utilizes both of these

## Features and structure
- Todo

### Core structure
- Todo
