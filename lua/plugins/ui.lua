--
-- UI Plugins
--

local lualine_theme = "gruvbox-material"

return {
	-- Status Line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = lualine_theme,
		},
	},

	-- Bottom Left LSP info
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	},

	-- Better Notifications
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- Floating window-line names
	{
		"b0o/incline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local helpers = require("incline.helpers")
			local devicons = require("nvim-web-devicons")

			require("incline").setup({
				window = {
					padding = 0,
					margin = { horizontal = 0 },
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if filename == "" then
						filename = "[No Name]"
					end
					local ft_icon, ft_color = devicons.get_icon_color(filename)
					local modified = vim.bo[props.buf].modified
					return {
						ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
							or "",
						" ",
						{ filename, gui = modified and "bold,italic" or "bold" },
						" ",
					}
				end,
			})
		end,
		event = "VeryLazy",
	},

	-- Go to selected line
	{
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	},

	-- Various quality of life
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			scroll = { enabled = true },
			indent = { enabled = true },
		},
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		keys = {
			{ "-", "<CMD>Oil<CR>", desc = "Open parent directory." },
		},
	},
}
