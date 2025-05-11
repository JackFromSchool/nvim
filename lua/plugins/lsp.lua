--
-- LSP Plugins
-- and configuration
--

return {
   -- Manage LSP's / Formatters
   {
      "williamboman/mason.nvim",
      opts = {
         ensure_installed = {
            -- Lua
            "lua-language-server",
            "stylua",
            -- C/C++
            "clangd",
            "clangfmt",
            -- Rust
            "rust-analyzer",
            -- Python
            "python-lsp-server",
            -- Verilog
            "hdl-checker",
            -- Haskell
            "haskell-language-server",
         },
      },
      config = function(_, opts)
         require("mason").setup(opts)
      end,
   },
   -- Auto initiate LSP's
   {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
         "williamboman/mason.nvim",
      },
      opts = {
         automatic_enable = {
            exclude = {
               "lua-language-server",
            },
         },
      },
      config = function(_, opts)
         require("mason-lspconfig").setup(opts)
      end,
   },

   {
      "neovim/nvim-lspconfig",
      dependencies = {
         "williamboman/mason-lspconfig.nvim",
         {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
               library = {
                  -- See the configuration section for more details
                  -- Load luvit types when the `vim.uv` word is found
                  { path = "${3rd}/luv/library", words = { "vim%.uv" } },
               },
            },
         },
      },
      config = function()
         -- Manually configure servers here:
      end,
   },

   -- Set up auto formatting by LSP and formatters
   {
      "stevearc/conform.nvim",
      event = "BufWritePre",
      opts = {
         formatters_by_ft = {
            lua = { "stylua" },
            c = { "clangfmt" },
            cpp = { "clangfmt" },
            h = { "clangfmt" },
            hpp = { "clangfmt" },
            rust = { "rustfmt" },
         },

         format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
         },
      },
   },

   {
      "saghen/blink.cmp",
      dependencies = {
         "rafamadriz/friendly-snippets",
         "onsails/lspkind.nvim",
      },
      build = "cargo build --release",

      opts = {
         -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
         -- 'super-tab' for mappings similar to vscode (tab to accept)
         -- 'enter' for enter to accept
         -- 'none' for no mappings
         --
         -- All presets have the following mappings:
         -- C-space: Open menu or open docs if already open
         -- C-n/C-p or Up/Down: Select next/previous item
         -- C-e: Hide menu
         -- C-k: Toggle signature help (if signature.enabled = true)
         --
         -- See :h blink-cmp-config-keymap for defining your own keymap
         keymap = { preset = "default" },

         appearance = {
            nerd_font_variant = "mono",
         },

         signature = { enabled = true },

         fuzzy = { implementation = "prefer_rust_with_warning" },

         completion = {
            documentation = { auto_show = true },
            menu = {
               draw = {
                  components = {
                     kind_icon = {
                        text = function(ctx)
                           local icon = ctx.kind_icon
                           if vim.tbl_contains({ "Path" }, ctx.source_name) then
                              local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                              if dev_icon then
                                 icon = dev_icon
                              end
                           else
                              icon = require("lspkind").symbolic(ctx.kind, {
                                 mode = "symbol",
                              })
                           end

                           return icon .. ctx.icon_gap
                        end,

                        -- Optionally, use the highlight groups from nvim-web-devicons
                        -- You can also add the same function for `kind.highlight` if you want to
                        -- keep the highlight groups in sync with the icons.
                        highlight = function(ctx)
                           local hl = ctx.kind_hl
                           if vim.tbl_contains({ "Path" }, ctx.source_name) then
                              local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                              if dev_icon then
                                 hl = dev_hl
                              end
                           end
                           return hl
                        end,
                     },
                  },
               },
            },
         },
      },
      opts_extend = { "sources.default" },
   },
   -- Diagnosics and LSP Info
   {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
         {
            "<leader>ti",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
         },
         {
            "<leader>tI",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
         },
         {
            "<leader>to",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
         },
      },
   },

   {
      "rachartier/tiny-inline-diagnostic.nvim",
      event = "VeryLazy",
      priority = 1000,
      config = function()
         require("tiny-inline-diagnostic").setup()
         vim.diagnostic.config({ virtual_text = false })
      end,
   },
}
