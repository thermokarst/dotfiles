return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python"),
          require("rustaceanvim.neotest"),
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>t", "", { desc = "+testing" })
      vim.keymap.set({ "n", "v" }, "<leader>tt", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end, { desc = "run file" })
      vim.keymap.set({ "n", "v" }, "<leader>tT", function()
        require("neotest").run.run(vim.uv.cwd())
      end, { desc = "run all test files" })
      vim.keymap.set({ "n", "v" }, "<leader>tr", function()
        require("neotest").run.run()
      end, { desc = "run nearest" })
      vim.keymap.set({ "n", "v" }, "<leader>tl", function()
        require("neotest").run.run_last()
      end, { desc = "run last" })
      vim.keymap.set({ "n", "v" }, "<leader>ts", function()
        require("neotest").summary.toggle()
      end, { desc = "toggle summary" })
      vim.keymap.set({ "n", "v" }, "<leader>to", function()
        require("neotest").output.open({ enter = true, auto_close = true })
      end, { desc = "show output" })
      vim.keymap.set({ "n", "v" }, "<leader>to", function()
        require("neotest").output_panel.toggle()
      end, { desc = "toggle output panel" })
      vim.keymap.set({ "n", "v" }, "<leader>ts", function()
        require("neotest").run.stop()
      end, { desc = "stop" })
      vim.keymap.set({ "n", "v" }, "<leader>tw", function()
        require("neotest").watch.toggle(vim.fn.expand("%"))
      end, { desc = "toggle watch" })
    end,
  },
  {
    "nvim-neotest/neotest-python",
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
  },
}
