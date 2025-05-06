return {
	{
		"tamton-aquib/duck.nvim",
		config = function()
			vim.keymap.set("n", "<leader>dd", function()
				require("duck").hatch()
				vim.api.nvim_create_autocmd("WinClosed", {
					once = true,
					group = vim.api.nvim_create_augroup("duck.kill_on_close", { clear = false }),
					callback = function()
						if require("duck").ducks_list[1] ~= nil then
							require("duck").cook_all()
						end
					end,
				})
			end, {})
			vim.keymap.set("n", "<leader>dk", function()
				require("duck").cook()
			end, {})
			vim.keymap.set("n", "<leader>da", function()
				require("duck").cook_all()
			end, {})
		end,
	},

	{
		"eandrju/cellular-automaton.nvim",
		cmd = "CellularAutomaton",
	},
}
