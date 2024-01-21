local util = require 'lspconfig.util'
return {
    cmd = { 'svelteserver', '--stdio' },
    filetype = { 'svelte' },
    root_dir = util.root_pattern("svelte.config.ts", "svelte.config.js")
}
