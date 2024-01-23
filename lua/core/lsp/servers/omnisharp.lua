local omnisharp_bin = vim.fn.stdpath("data") .. "\\mason\\packages\\omnisharp\\libexec\\Omnisharp.dll"
local pid = vim.fn.getpid()

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
		["textDocument/definition"] = require("omnisharp_extended").handler,
	},
	cmd = { 'dotnet', omnisharp_bin, "--languageserver", "--hostPID", tostring(pid), 'RoslynExtensionsOptions:EnableDecompilationSupport=true' },
}
