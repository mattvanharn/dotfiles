-- lualine — olive gradient: darkest at edges, cream in center
return {
	"nvim-lualine/lualine.nvim",
	opts = function(_, opts)
		local palette = {
			darkest  = "#758a6c",
			medium   = "#99aa91",
			light    = "#cbd5c7",
			lightest = "#dfe6dd",
			cream    = "#edeae1",
			fg       = "#1E2D25",
		}

		local theme = {
			normal = {
				a = { bg = palette.darkest,  fg = palette.cream, gui = "bold" },
				b = { bg = palette.medium,   fg = palette.fg },
				c = { bg = palette.cream,    fg = palette.fg },
			},
			insert = {
				a = { bg = palette.medium,   fg = palette.fg,    gui = "bold" },
				b = { bg = palette.light,    fg = palette.fg },
				c = { bg = palette.cream,    fg = palette.fg },
			},
			visual = {
				a = { bg = palette.darkest,  fg = palette.cream, gui = "bold" },
				b = { bg = palette.medium,   fg = palette.fg },
				c = { bg = palette.cream,    fg = palette.fg },
			},
			replace = {
				a = { bg = palette.fg,       fg = palette.cream, gui = "bold" },
				b = { bg = palette.medium,   fg = palette.fg },
				c = { bg = palette.cream,    fg = palette.fg },
			},
			command = {
				a = { bg = palette.darkest,  fg = palette.cream, gui = "bold" },
				b = { bg = palette.medium,   fg = palette.fg },
				c = { bg = palette.cream,    fg = palette.fg },
			},
			inactive = {
				a = { bg = palette.light,    fg = palette.medium },
				b = { bg = palette.light,    fg = palette.medium },
				c = { bg = palette.lightest, fg = palette.medium },
			},
		}

		opts.options = opts.options or {}
		opts.options.theme = theme

		return opts
	end,
}
