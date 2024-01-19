## Tonight
Write Pretty print function, tired of writing `print(vim.inspect(....))`

- [X] Default options
    - Which is overwritten if `options/user_options` is found inside of the user folder
- [X] Setup basic keymaps
    - Grab from current config
    - [X] Setup plugin keymaps via `core.plugins` but return a keys module from the config that's called on the keys property for LazyVim
- [X] Setup Telescope
    - Extensions
    - Mappings
- [ ] Treesitter
    - Extensions
        - [ ] TextObjects
    - Mappings
- [ ] Setup LSP
    - Setup formatter settings
    - Need to finish setup for TSServer, Tailwindcss, HTML, Svelte
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
