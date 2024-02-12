# TODO
- Setup help-doc
- lazygit nvim or fugitive

## Keymaps
For setting up overrwritable keymaps
    - Create a base table for the Distros
      starting keymaps
    - Then an empty table for users then `tbl_deep_extend`
      merge them, that way uses can safely overwrite default maps
      I set.

## Clean-up
- [ ] use cond enabled and is !vim.g.vscode for plugins
    - Figure out what plugins are vscode safe, like nvim-surround should be safe, but GUI plugins arent
- [ ] Write Svelte Treesitter queries to improve special block highlighting and indenting

## After Release
- [ ] DAP setup
    - [ ] C/C#
    - [ ] JS/TS
