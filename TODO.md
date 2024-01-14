- [X] Default options
    - Which is overwritten if `options/user_options` is found inside of the user folder
- [X] Setup basic keymaps
    - Grab from current config
- [ ] Setup Telescope
    - Extensions
    - Mappings
- [ ] Treesitter
    - Extensions
        - TextObjects
        - Context
    - Mappings
- [ ] Setup LSP
    - Going to use `lsp-zero` for this

---
Use `enabled(xx,'')` to disable certain things on large file loads
---
## Further Config Setup
- Look for additional `user.*` files
 - `user.plugins`
    - Disable preinstalled and install new plugins
 - `user.colorscheme`
    - Allow user override default scheme if colorscheme has a `set` key
 - `user.keymaps`
    - Should override existing keys, but warn user they are being overriden once
