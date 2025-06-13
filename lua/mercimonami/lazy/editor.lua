return {
  {
    "echasnovski/mini.hipatterns",
    event = "BufReadPre",
    opts = function()
      local hipatterns = require("mini.hipatterns")
      return {
        highlighters = {
          -- highlight #rrggbb hex colors
          hex_color = hipatterns.gen_highlighter.hex_color({
            group = "MiniHipatternsHexColor",
            bg = true,
          }),
        },
      }
    end,
  },
}
