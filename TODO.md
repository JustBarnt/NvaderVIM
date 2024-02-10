# Todo
- [ ] Refactor plugin spec as follows for user config
    - `user/plugins/[plugin]/init.lua`
        - Returns a module with at minimum a config object
    - Other files can be in the `[plugin]` dir --- init will import those and add them to the module
- [ ] Install and setup Neorg
- [ ] Setup `Which-Key`
    - Includes adding all plugins that use `<leader>`
- [ ] Setup help-doc
- [ ] Trouble: Finish setup (create key maps)
## Clean-up
- [ ] use cond enabled and is !vim.g.vscode for plugins
    - Figure out what plugins are vscode safe, like nvim-surround should be safe, but GUI plugins arent
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
