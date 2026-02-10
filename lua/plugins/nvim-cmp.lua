return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	opts = function()
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()
		return {
			auto_brackets = {},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-m>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),

				-- REPLACED: LazyVim.cmp.confirm -> cmp.mapping.confirm
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),

				-- REPLACED: LazyVim.cmp.map -> Standard tab behavior
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "path" },
			}, {
				{ name = "buffer" },
			}),
			formatting = {
				format = function(entry, item)
					-- DEFINED LOCALLY: No dependency on LazyVim.config
					local icons = {
						Text = " ",
						Method = "󰆧 ",
						Function = "󰊕 ",
						Constructor = " ",
						Field = "󰇽 ",
						Variable = "󰂡 ",
						Class = "󰠱 ",
						Interface = " ",
						Module = " ",
						Property = "󰜢 ",
						Unit = " ",
						Value = "󰎠 ",
						Enum = " ",
						Keyword = "󰌋 ",
						Snippet = " ",
						Color = "󰏘 ",
						File = "󰈙 ",
						Reference = " ",
						Folder = "󰉋 ",
						EnumMember = " ",
						Constant = "󰏿 ",
						Struct = " ",
						Event = " ",
						Operator = "󰆕 ",
						TypeParameter = "󰅲 ",
					}
					if icons[item.kind] then
						item.kind = icons[item.kind] .. item.kind
					end
					return item
				end,
			},
			experimental = {
				ghost_text = {
					hl_group = "CmpGhostText",
				},
			},
		}
	end,
	-- REMOVED: main = "lazyvim.util.cmp" (This module does not exist in your config)
}
