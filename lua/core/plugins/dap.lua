return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
  },
  config = function()
    local map = require("core.utils").map
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_virt_text = require("nvim-dap-virtual-text")
    dapui.setup({})
    dap_virt_text.setup({})

    dap.adapters.php = {
      type = "executable",
      command = "node",
      args = { vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
    }

    dap.configurations.php = {
      {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9313,
      },
    }

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated.dapui_confing = function()
      dapui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    map("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle Debugging Breakpoint" })
    map("n", "<leader>db", dap.run_to_cursor, { desc = "Debug at Cursor" })
    map("n", "<leader>?", function()
      dapui.eval(nil, { enter = true })
    end, { desc = "Eval varialbe under cursor" })

    map("n", "<leader>ds", dapui.toggle, { desc = "Toggle DapUI" })
    map("n", "<F1>", dap.continue, { desc = "Debug Continue" })
    map("n", "<F2>", dap.step_into, { desc = "Debug Step Into" })
    map("n", "<F3>", dap.step_over, { desc = "Debug Step Over" })
    map("n", "<F4>", dap.step_out, { desc = "Debug Step Out" })
    map("n", "<F5>", dap.step_back, { desc = "Debug Step Back" })
    map("n", "<F13>", dap.restart, { desc = "Debug Restart" })
  end,
}
