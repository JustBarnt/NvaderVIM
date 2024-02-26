return {
    "LintaoAmons/cd-project.nvim",
    config = function()
        local project = require 'cd-project'
        local exists, user_config = pcall(require, 'user.config')
        local config = exists and type(user_config) == "table" and user_config.project or {}
    

    end
}
