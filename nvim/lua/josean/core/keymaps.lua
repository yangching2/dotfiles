-- set leader key to space
-- vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
-- keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
-- keymap.set("n", "<leader>+", "<C-a>") -- increment
--
--
-- -- window management
-- keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
-- keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>tc", ":tabnew<CR>") -- create new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
keymap.set("n", "<leader><TAB>", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
-- keymap.set("n", "<leader>fl", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
-- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
-- keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
-- keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

keymap.set("n", ";;", "<cmd>Telescope find_files<cr>")
keymap.set("n", ";b", "<cmd>Telescope buffers<cr>")
keymap.set("n", ";c", "<cmd>Telescope grep_string<cr>")
keymap.set("n", ";h", "<cmd>Telescope help_tags<cr>")
keymap.set("n", ";l", "<cmd>Telescope live_grep<cr>")
keymap.set("n", ";s", "<cmd>Telescope lsp_document_symbols<cr>")
keymap.set("n", ";r", "<cmd>Telescope lsp_references<cr>")

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- Some servers have issues with backup files, see #649.
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Auto complete
function _G.check_back_space()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
-- Use K to show documentation in preview window.
function _G.show_docs()
	local cw = vim.fn.expand("<cword>")
	if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
		vim.api.nvim_command("h " .. cw)
	else
		vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
	end
end
keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })
-- Add (Neo)Vim's native statusline support.
-- provide custom statusline: lightline.vim, vim-airline.
