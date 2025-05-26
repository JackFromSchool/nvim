return {
   -- Cool Markdown Render
   {
      "MeanderingProgrammer/render-markdown.nvim",

      opts = {
         completions = {
            blink = { enabled = true },
         },
         render_modes = true,
      },

      -- TODO: Fix this at some point
      latex = {
         enabled = false,
         render_modes = false,
         converter = "latex2text",
         highlight = "RenderMarkdownMath",
         position = "above",
         top_pad = 0,
         bottom_pad = 0,
      },
   },
}
