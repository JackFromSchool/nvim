return {
   {
      "nvim-treesitter/nvim-treesitter",
      branch = "main",
      build = ":TSUpdate",
      opts = {
         auto_install = true,
         highlight = {
            enable = true,
         },
         indent = { enable = true },
      },
      config = function(_, opts)
         require("nvim-treesitter").setup(opts)
      end,
   },
}
