return {
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	settings = {
		javascript = {
			inlayhints = {
                includeinlayparameternamehints = "all", -- 'none' | 'literals' | 'all';
                includeinlayparameternamehintswhenargumentmatchesname = false,
                includeinlayfunctionparametertypehints = true,
                includeinlayvariabletypehints = false,
                includeinlaypropertydeclarationtypehints = true,
                includeinlayfunctionlikereturntypehints = false,
				includeinlayenummembervaluehints = true,
			},
            suggest = {
                includecompletionsformoduleexports = true,
            }
		},
		typescript = {
			inlayhints = {
                includeinlayparameternamehints = "all", -- 'none' | 'literals' | 'all';
                includeinlayparameternamehintswhenargumentmatchesname = false,
                includeinlayfunctionparametertypehints = true,
                includeinlayvariabletypehints = false,
                includeinlaypropertydeclarationtypehints = true,
                includeinlayfunctionlikereturntypehints = false,
				includeinlayenummembervaluehints = true,
			},
            suggest = {
                includecompletionsformoduleexports = true,
            }
		},
	},
}
