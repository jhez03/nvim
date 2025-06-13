return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup({
        -- your custom overrides (optional)
        override = {},
        default = true, -- enable default icons for filetypes
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night", -- Try "night", "storm", "moon", or "day"
      transparent = true, -- Makes the background fully transparent
      styles = {
        sidebars = "transparent", -- Sidebars (like Neo-tree) are also transparent
        floats = "transparent", -- Floating windows are transparent
      },
      -- This function customizes the basic palette (get creative!)
      on_colors = function(colors)
        colors.bg = "NONE" -- main background transparent
        colors.bg_sidebar = "#11111b" -- sidebars extra dark purple/blue
        colors.fg = "#b5e8e0" -- main foreground a bit cyan
      end,
      -- This lets you override individual highlight groups!
      on_highlights = function(hl, colors)
        hl.Normal = { bg = "NONE" } -- editor background transparent
        hl.NormalFloat = { bg = "NONE" } -- floating windows transparent
        hl.LineNr = { fg = "#a0a0a0" } -- line numbers gray
        hl.CursorLineNr = { fg = "#ff8800", bold = true } -- cursor line number orange & bold
        -- Make Neo-tree sidebar title extra visible
        hl.NeoTreeTitleBar = { fg = "#ffcc00", bg = "NONE", bold = true }
        -- You can keep adding custom highlights here!
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
