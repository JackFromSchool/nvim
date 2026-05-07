return {
   {
      "mfussenegger/nvim-dap",
      lazy = true,
      keys = {
         {
            "<leader>db",
            function() require("dap").toggle_breakpoint() end,
            desc = "Toggle Breakpoint"
         },

         {
            "<leader>dc",
            function() require("dap").continue() end,
            desc = "Continue"
         },

         {
            "<leader>dC",
            function() require("dap").run_to_cursor() end,
            desc = "Run to Cursor"
         },

         {
            "<leader>dT",
            function() require("dap").terminate() end,
            desc = "Terminate"
         },

         {
            "<leader>dso",
            function() require("dap").step_over() end,
            desc = "Step Over"
         },

         {
            "<leader>dsi",
            function() require("dap").step_into() end,
            desc = "Step Into"
         },

         {
            "<leader>dsx",
            function() require("dap").step_out() end,
            desc = "Step Out"
         }
      },
      config = function()
         local dap = require("dap")

         dap.adapters.gdb_arm_none_eabi = {
            type = 'executable',
            command = 'arm-none-eabi-gdb',
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
         }

         dap.adapters.gdb = {
           type = "executable",
           command = "gdb",
           args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
         }

         dap.configurations.c = {
            {
               name = "Debug Arm with OpenOCD",
               type = "gdb_arm_none_eabi",
               request = "attach",
               target = "localhost:3333",
               cwd = "${workspaceFolder}",
               program = function() 
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
               end,
            },
            {
               name = "GDB",
               type = "gdb",
               request = "launch",
               cwd = "${workspaceFolder}",
               program = function() 
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
               end,
            },
         }
      end,
   },
   {
      "jay-babu/mason-nvim-dap.nvim",
      opts = {
         handlers = {},
         ensure_installed = {
            "codelldb",
         }
      },
      dependencies = {
         "mfussenegger/nvim-dap",
         "williamboan/mason.nvim",
      }
   },
   {
      "theHamsta/nvim-dap-virtual-text",
      config = true,
      dependencies = {
         "mfussenegger/nvim-dap",
      },
   },
   {
      "igorlfs/nvim-dap-view",
      opts = {}
   },
   { 
      "rcarriga/nvim-dap-ui", 
      dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} ,
      config = function()
         local dap, dapui = require("dap"), require("dapui")
         dapui.setup()

         dap.listeners.before.attach.dapui_config = function()
           dapui.open()
         end
         dap.listeners.before.launch.dapui_config = function()
           dapui.open()
         end
         dap.listeners.before.event_terminated.dapui_config = function()
           dapui.close()
         end
         dap.listeners.before.event_exited.dapui_config = function()
           dapui.close()
         end
      end
   }
}
