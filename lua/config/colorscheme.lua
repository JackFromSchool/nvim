local function source_matugen()
   local matugen_path = os.getenv("HOME") .. "/.config/nvim/matugen.lua"
   local file, err = io.open(matugen_path, "r")

   if err ~= nil then
      vim.cmd('colorscheme everforest')
   else
      vim.cmd('colorscheme everforest')
   end
end

-- Main entrypoint on matugen reloads
local function auxiliary_function()
   -- Load the matugen style file to get all the new colors
   source_matugen()
end

vim.api.nvim_create_autocmd("Signal", {
   pattern = "SIGUSR1",
   callback = auxiliary_function,
})


auxiliary_function();
