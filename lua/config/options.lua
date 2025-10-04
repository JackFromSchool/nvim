local opt = vim.opt

-- Height of the Commandline
opt.cmdheight = 1

-- Highlight Searches
opt.hlsearch = true
-- Ignorecase in Search
opt.ignorecase = true

-- Diasable mouse
opt.mouse = ""

-- Enable relative line numbers
opt.number = true
opt.relativenumber = true

-- Direction of split
opt.splitbelow = true
opt.splitright = true

-- Disable line wrap
opt.wrap = false

-- Set Default Tab 3 Spaces
opt.tabstop = 3
opt.shiftwidth = 3
opt.expandtab = true

-- Highlight Current line
opt.cursorline = true

-- Line Number Width
opt.numberwidth = 2

-- One Status Bar
opt.laststatus = 3

-- Use termguicolors
opt.termguicolors = true

-- misc
opt.undofile = true
opt.updatetime = 300
opt.clipboard = "unnamedplus"
opt.fileencoding = "utf-8"
opt.shellcmdflag = "-c"
opt.shortmess:append("c")

-- Set terminal
if vim.fn.has("Unix") == 1 then
elseif vim.fn.has("win32") == 1 then
	opt.shell = "powershell"
	local powershell_options = {
		shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
		shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
		shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
		shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
		shellquote = "",
		shellxquote = "",
	}

	for option, value in pairs(powershell_options) do
		vim.opt[option] = value
	end
end

-- Add filetypes
vim.filetype.add({
	extension = {
		wgsl = "wgsl",
	},
})
