--
-- DEPRECIATED
-- Terminal Tools
--

local term_window = nil
local term_buffer = nil
local term_job_id = nil

local toggle_term = function()
   if term_window == nil then
      vim.cmd.vnew()
      vim.cmd.wincmd("J")
      vim.api.nvim_win_set_height(0, 12)
      term_window = vim.api.nvim_get_current_win()

      if term_buffer == nil then
         term_buffer = vim.api.nvim_create_buf(true, false)
         vim.api.nvim_win_set_buf(0, term_buffer)
         vim.cmd.term()
         term_job_id = vim.bo.channel
      else
         vim.api.nvim_win_set_buf(0, term_buffer)
      end
   else
      vim.api.nvim_win_close(term_window, true)
      term_window = nil
   end
end

vim.keymap.set("n", "<leader>tt", toggle_term)
-- TODO: Add full screen terminal option.

-- Run Cargo commands
vim.api.nvim_create_user_command("Cargo", function(args)
   if term_window == nil then
      toggle_term()
   end

   vim.fn.chansend(term_job_id, "cargo " .. args.args .. "\r\n");
end, { desc = "Run Cargo Commands", nargs = 1 })
