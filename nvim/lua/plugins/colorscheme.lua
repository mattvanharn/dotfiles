-- leaf.nvim colorscheme — clean, light, olive-toned.
-- transparent = true means neovim uses kitty's background instead of its own.
return {
	{
		"daschw/leaf.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local palette = {
				darkest = "#758a6c", -- darkest olive
				medium = "#99aa91", -- medium olive
				light = "#cbd5c7", -- light olive
				lightest = "#dfe6dd", -- lightest olive
				cream = "#edeae1", -- cream
			}

			require("leaf").setup({
				theme = "light",
				transparent = true,
				contrast = "medium",
				commentStyle = "italic",
				keywordStyle = "italic",
				statementStyle = "bold",
				colors = {
					bg0 = palette.light,
					bg1 = palette.lightest,
					bg2 = palette.medium,
					bg3 = palette.darkest,
				},
				overrides = {
					NormalFloat = { bg = palette.lightest },
					FloatBorder = { bg = palette.lightest, fg = palette.medium },
					RenderMarkdownCode = { bg = palette.lightest },
					RenderMarkdownCodeInline = { fg = "#1E2D25", bg = palette.lightest },
					-- navic breadcrumb context bar
					NavicText = { bg = palette.cream, fg = "#1E2D25" },
					NavicSeparator = { bg = palette.cream, fg = palette.medium },
					WinBar = { bg = palette.cream },
					WinBarNC = { bg = palette.cream },
				},
			})
			vim.cmd("colorscheme leaf")

			-- Claude Code chat: cream background, targeted by buffer name
			vim.api.nvim_create_autocmd("TermOpen", {
				callback = function(ev)
					local name = vim.api.nvim_buf_get_name(ev.buf)
					if name:lower():find("claude") then
						vim.api.nvim_set_hl(0, "ClaudeChatNormal", { bg = palette.cream })
						vim.schedule(function()
							for _, win in ipairs(vim.fn.win_findbuf(ev.buf)) do
								vim.api.nvim_set_option_value(
									"winhighlight",
									"Normal:ClaudeChatNormal,NormalFloat:ClaudeChatNormal",
									{ win = win }
								)
							end
						end)
					end
				end,
			})
		end,
	},

	-- Tell LazyVim not to override our colorscheme
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "leaf",
		},
	},
}
