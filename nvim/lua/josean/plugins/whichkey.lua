local whichkey_status, wkPlugin = pcall(require, "cmp")
if not whichkey_status then
	return
end

local wk = require("which-key")
-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
wk.register({
	["<leader>s"] = {
		name = "Search",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		b = {
			function()
				print("foobar test message printed")
			end,
			"Print foobar test msg",
		},
	},
	["<leader><Tab>"] = {
		":tabn<CR>",
		"Next Tab",
	},
	["<leader>c"] = {
		f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format Code" },
	},
	g = {
		name = "Go To / Comment",
		r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References", noremap = true, unique = true },
		d = { "<cmd>Telescope lsp_definitions<cr>", "Go to Definition" },
		D = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" },
		f = { "<cmd>Lspsaga lsp_finder<cr>", "LSP finder", noremap = true },
		j = { "<cmd> Lspsaga diagnostic_jump_next<cr>", "diagnostic_jump_next", noremap = true, silent = true },
		k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "diagnostic_jump_prev", noremap = true, silent = true },
		i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementations", noremap = true },
	},
	-- ["<C-b>"] = {
	-- 	name = "Tab",
	--
	-- 	o = { "<cmd>tabnew<CR>" },
	-- 	x = { "<cmd>tabclose<CR>" },
	-- 	n = { ":tabn<CR>" },
	-- 	p = { ":tabp<CR>" },
	-- },
})
