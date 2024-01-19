local omnisharp_bin = vim.fn.stdpath("data") .. "\\mason\\packages\\omnisharp\\libexec\\Omnisharp.dll"
--[[
    Make sure an .omnisharp.json file exists in ~./omnisharp/.omnisharp.json with at least the following snippets
    {
      "RoslynExtensionsOptions": {
        "enableDecompilationSupport": true
      }
    }
]]

return {
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler,
    },
	cmd = { 'dotnet', omnisharp_bin, 'RoslynExtensionsOptions:EnableDecompilationSupport=true'},
}
