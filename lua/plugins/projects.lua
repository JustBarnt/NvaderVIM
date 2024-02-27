return {
    "LintaoAmons/cd-project.nvim",
    config = function()
        local project = require 'cd-project'
        local config = require 'user.plugins.projects'
        
        project.setup(config)
    end
}
