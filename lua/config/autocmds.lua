--
-- Autocommands
--

local augroup = function(name)
	vim.api.nvim_create_augroup("jack." .. name, { clear = true })
end

-- Enable spell checking within files that contain written text
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("text_opts"),
	pattern = { "text", "markdown", "gitcommit", "typst", "plaintex" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.wrap = true
		vim.opt_local.textwidth = 80
	end,
})

-- Show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	group = augroup("auto_cursorline_on"),
	callback = function(event)
		if vim.bo[event.buf].buftype == "" then
			vim.opt_local.cursorline = true
		end
	end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
	group = augroup("auto_cursorline_off"),
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

-- Light autosave
--[[ vim.api.nvim_create_autocmd({ "VimSuspend", "FocusLost" }, {
	group = augroup("autosave"),
   callback = function()


}) ]]
