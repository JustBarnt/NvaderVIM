- [X] Default options
    - Which is overwritten if `options/user_options` is found inside of the user folder
- [X] Setup basic keymaps
    - Grab from current config
    - [ ] Setup plugin keymaps via `core.plugins` but return a keys module from the config that's called on the keys property for LazyVim
- [ ] Setup Telescope
    - Extensions
    - Mappings
- [ ] Treesitter
    - Extensions
        - [ ] TextObjects
    - Mappings
- [ ] Setup LSP
    - [X] Going to use `lsp-zero` for this
    - Setup formatter settings
---
Use `enabled(xx,'')` to disable certain things on large file loads
Test `tbl_deep_extend` to see if it will merge tables or if I should use `tbl_extend`
---

## Further Config Setup
- Look for additional `user.*` files
 - `user.plugins`
    - Disable preinstalled and install new plugins
 - `user.colorscheme`
    - Allow user override default scheme if colorscheme has a `set` key
 - `user.keymaps`
    - Should override existing keys, but warn user they are being overriden once
