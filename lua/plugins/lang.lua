return {
  -- disable the fancy UI for the debugger
  { "rcarriga/nvim-dap-ui", enabled = false },

  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>de",
        function()
          require("dap.ui.widgets").centered_float(require("dap.ui.widgets").expression, { border = "none" })
        end,
        desc = "Eval",
        mode = { "n", "v" },
      },
      {
        "<leader>dwf",
        function()
          require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames, { border = "none" })
        end,
        desc = "Frames",
      },
      {
        "<leader>dws",
        function()
          require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes, { border = "none" })
        end,
        desc = "Scopes",
      },
      {
        "<leader>dwt",
        function()
          require("dap.ui.widgets").centered_float(require("dap.ui.widgets").threads, { border = "none" })
        end,
        desc = "Threads",
      },
    },
    opts = function(_)
      require("dap").defaults.fallback.terminal_win_cmd = "enew | set filetype=dap-terminal"
    end,
  },

  { import = "lazyvim.plugins.extras.dap.nlua" },

  -- custom language specific extension modules
  { import = "plugins.extras.lang.java" },
  { import = "plugins.extras.lang.rust" },
  { import = "plugins.extras.lang.nodejs" },
}
