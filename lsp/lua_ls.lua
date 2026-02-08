local root_markers1 = {
	".emmyrc.json",
	".luarc.json",
	".luarc.jsonc",
}
local root_markers2 = {
	".luacheckrc",
	".stylua.toml",
	"stylua.toml",
	"selene.toml",
	"selene.yml",
}

---@type vim.lsp.Config
return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers1, root_markers2, { ".git" } }
		or vim.list_extend(vim.list_extend(root_markers1, root_markers2), { ".git" }),
	settings = {
		Lua = {
			diagnostics = {
				-- Adds the vim to the global imports
				globals = { "vim" },
			},
			workspace = {
				-- Helps load actual vim files from runtime so that documentation and other stuff is available on hover
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false, -- Stop asking to configure environment
			},
			codeLens = { enable = true },
			hint = { enable = true, semicolon = "Disable" },
		},
	},
}
