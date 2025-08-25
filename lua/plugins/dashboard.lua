return {
	"nvimdev/dashboard-nvim",
	event = "vimenter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
					"",
					"",
					"",
					"",
					"",
					"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
					"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
					"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
					"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
					"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
					"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
					"",
					"",
					"",
				},
				center = {
					{
						icon = "  ",
						desc = "Recently Opened Files",
						key = "r",
						action = "Telescope oldfiles",
					},
					{
						icon = "  ",
						desc = "Find File",
						key = "f",
						action = "Telescope find_files",
					},
					{
						icon = "  ",
						desc = "Find Word",
						key = "w",
						action = "Telescope live_grep",
					},
					{
						icon = "  ",
						desc = "New File",
						key = "n",
						action = "enew",
					},
					{
						icon = "  ",
						desc = "Bookmarks",
						key = "b",
						action = "Telescope marks",
					},
					{
						icon = "  ",
						desc = "Config",
						key = "c",
						action = "cd ~/.config/nvim/ | Telescope find_files",
					},
					{
						icon = "  ",
						desc = "Quit Neovim",
						key = "q",
						action = "qa",
					},
				},
				footer = {
					"",
					"💤 powered by lazy.nvim",
					"",
				},
			},
		})
	end,
}
