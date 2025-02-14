return {
  "yetone/avante.nvim",
  opts = {
    provider = "copilot",
  },
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      config = function()
        require("copilot").setup({
          copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v22.14.0/bin/node",
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
      end,
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  config = function()
    vim.keymap.set({ "n", "v" }, "<leader>a", "", { desc = "+ai" })
  end,
}
