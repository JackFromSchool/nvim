local options = {
	cmdheight = 1,
	hlsearch = true,
	ignorecase = true,
	splitbelow = true,
	splitright = true,
	cursorline = true,
	number = true,
	tabstop = 3,
	shiftwidth = 3,
	expandtab = true,
	numberwidth = 4,
	termguicolors = true,
	undofile = true,
	updatetime = 300,
	wrap = false,
	relativenumber = true,
   clipboard = "unnamedplus",
   fileencoding = "utf-8",
   shell = 'powershell',
   shellcmdflag = "-c",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.filetype.add({
   extension = {
      wgsl = 'wgsl',
   }
})

