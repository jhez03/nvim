return {
  -- PHPCS installation.
  -- https://github.com/WordPress/WordPress-Coding-Standards?tab=readme-ov-file#installation
  {
    "praem90/nvim-phpcsf",
    config = function()
      local phpcs_group = vim.api.nvim_create_augroup("PHPCSGroup", { clear = true })
      vim.g.nvim_phpcs_config_phpcs_path = "phpcs"
      vim.g.nvim_phpcs_config_phpcbf_path = "phpcbf"
      vim.g.nvim_phpcs_config_phpcs_standard = vim.fn.getcwd() .. "/phpcs.xml.dist" -- or path to your ruleset phpcs.xml

      -- Setup auto formatting for php files using phpcs
      -- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
      --   group = phpcs_group,
      --   pattern = "*.php",
      --   callback = function()
      --     require("phpcs").cs()
      --   end,
      -- })
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = phpcs_group,
        pattern = "*.php",
        callback = function()
          require("phpcs").cbf()
        end,
      })

      vim.keymap.set("n", "<leader>lp", function()
        print("Running PHPCS...")
        require("phpcs").cbf()
      end, {
        silent = true,
        noremap = true,
        desc = "PHP Fix",
      })
    end,
  },
}
