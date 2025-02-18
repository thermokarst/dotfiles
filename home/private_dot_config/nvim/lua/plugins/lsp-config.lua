return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "marksman", "rust_analyzer", "pyright" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- markdown
      lspconfig.marksman.setup({
        capabilities = capabilities,
      })

      -- rust
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })

      -- python
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>c", "", { desc = "+code" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "action" })
      vim.keymap.set({ "n", "v" }, "<leader>cr", vim.lsp.buf.rename, { desc = "rename" })
    end,
  },
}
