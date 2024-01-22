# List
- [ ] nvim-surround
- [ ] Telescope Filebrowser
- [ ] Migrate all existing configs to a plugins folder inside the `user` folder
    - so the `user` folder will have
        - `user/init` - The main config that applies everything,
        - `user/plugins` - Will house all plugin settings as modules that `user/init` will import

### Possibly
- [ ] Reactive?
- [ ] Muren?
---
## After Release
- [ ] DAP setup
    - [ ] C/C#
    - [ ] JS/TS

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
