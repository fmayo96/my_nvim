return {
    {
      "mason-org/mason.nvim",
      config = function()
       require("mason").setup()
      end
    },
    {
       "mason-org/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = {"lua_ls", "ts_ls", "pyright"}
        })
        end

    },
    {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.pyright.setup({})
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    end
    }
}
