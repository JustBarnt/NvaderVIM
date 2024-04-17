![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)
# NvaderVIM
This is my creation of a Neovim Distribution.

### Why?
Other Distros included multiple plugins I didn't use and I wanted to use this as a good experience to learn more about neovim itself. As well as this sounded fun to build.

## Pre-requisites
1. Neovim >= 0.9.5
  lthrough I recommend you build from nightly
2. a `C` compliler for `nvim-treesitter`
    make` optional, but there are plugins that use `make` such as `telescope-fzf` for fuzzy finding
3. [Ripgrep](https://github.com/BurntSushi/ripgrep) is required for Telescope grep searching which this Distribution uses as a core feature
4. [fd](https://github.com/sharkdp/fd) is a cross-platform `find` like program that `Telescope` uses for its 'find_files' functionality to deliver insanely fast file searching
5. Git >= 2.19.0
6. Any terminal that supports true color and undercurl.
    - Ex: kitty (Linux/Mac), wezterm (Linux/Mac/Windows)
    - WindowsTerminal now supports undercurl as of `1.19`

### Optionals
1. [Nerd Fonts](https://nerdfonts.com) - All icons used are nerd font specific so without them icons will look similar to what you see in github when looking at icons defined in the repo
3. [Node](https://nodejs.org) - Required to download several LSP's

## Installation

### Linux/Mac OS (Unix)

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the template repository

```shell
git clone https://github.com/JustBarnt/NvaderVIM ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
```

### Windows (Powershell)

#### Make a backup of your current nvim and nvim-data folder

```pwsh
Rename-Item -Path $env:LOCALAPPDATA\nvim -NewName $env:LOCALAPPDATA\nvim.bak
Rename-Item -Path $env:LOCALAPPDATA\nvim-data -NewName $env:LOCALAPPDATA\nvim-data.bak
```

#### Clone the repository

```pwsh
git clone https://github.com/JustBarnt/NvaderVIM $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
nvim
```

### Configuration
1. You need to move|copy `lua/default_config.lua` -> `lua/user/config.lua`
2. After that your config will overwrite anything of the items you see defined in the configuration

# TODO
- [] Add Preview Images
