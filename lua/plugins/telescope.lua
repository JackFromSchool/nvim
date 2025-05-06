return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release ; cmake --build build --config Release",
		},
	},

	keys = {
		{ "<leader>ff", require("telescope.builtin").find_files, desc = "Telescope: Find Files" },
		{ "<leader>fg", require("telescope.builtin").live_grep, desc = "Telescope: Live Grep" },
	},
}
