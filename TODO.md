# List
- [X] Need to Fix LSP first, I think I have some cyclinic loop of dependency grabbing
- [X] TodoComments
- [X] nvim-surround
- [X] Telescope Filebrowser
- [ ] Trouble: Finish setup (create key maps)
- [ ] use cond enabled and is !vim.g.vscode for plugins
    - Figure out what plugins are vscode safe, like nvim-surround should be safe, but GUI plugins arent

- [ ] Strucural Improvements
    - [X] Split LSP files so on_attach, capabilities, and handlers are in their own file
    - [ ] Migrate all existing configs to a plugins folder inside the `user` folder
        - so the `user` folder will have
            - `user/init` - The main config that applies everything,
            - `user/plugins` - Will house all plugin settings as modules that `user/init` will import
            - Move colorscheme setup to `user/` instead of `core/`
            - Move user plugin specs out of `user/config.lua`

- [ ] Write Svelte Treesitter queries to improve special block highlighting and indenting
### Nice to have
- [ ] Allow users to override keymaps - But if its a keymap I have already set, warn the user

## After Release
- [ ] DAP setup
    - [ ] C/C#
    - [ ] JS/TS
---
Use `enabled(xx,'')` to disable certain things on large file loads
Test `tbl_deep_extend` to see if it will merge tables or if I should use `tbl_extend`
---
