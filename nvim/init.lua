vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
vim.opt.completeopt = { "menuone", "menu", "noselect", "popup" }
vim.opt.clipboard = "unnamedplus"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr-o:block"

vim.g.mapleader = " "

-- disabling arrows cus i cant stop using them ueueueu
local opts = { noremap = true, silent = true }

vim.keymap.set({'n','v','x','o'}, '<Up>', '<Nop>', opts)
vim.keymap.set({'n','v','x','o'}, '<Down>', '<Nop>', opts)
vim.keymap.set({'n','v','x','o'}, '<Left>', '<Nop>', opts)
vim.keymap.set({'n','v','x','o'}, '<Right>', '<Nop>', opts)


vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")
vim.keymap.set('n', '<leader>p', ":TypstPreviewToggle<CR>")
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

vim.pack.add({
	{ src = "https://github.com/RRethy/base16-nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
})

require("colors.colors").setup()
require "mason".setup()
require "mini.pick".setup()
require "oil".setup({
	view_options = {
		show_hidden = true
	}
})

require("nvim-treesitter").setup({
	ensure_installed = { "lua", "c", "cpp", "rust", "typst" },
	highlight = { enable = true }
})

vim.lsp.enable({ "lua_ls", "clangd", "rust_analyzer", "tinymist" })

