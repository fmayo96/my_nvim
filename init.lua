vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<space>fd", builtin.find_files)
vim.keymap.set("n", "<space>fg", builtin.live_grep)
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- Or any other character you prefer
  },
})

vim.keymap.set("n", "<C-t>", ":ToggleTerm size=12 direction=horizontal<CR>", {noremap=true, silent=true})

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    vim.lsp.buf.format({
      bufnr = args.buf,
      timeout_ms = 2000, -- optional
    })
  end,
})
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })

