-- Install a theme: add its GitHub repo below and restart nvim (or run :Lazy install).
-- Remove a theme: delete its line and run :Lazy clean.
-- Switch themes with <leader>st; the choice is remembered across restarts.
return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "propet/colorscheme-persist.nvim",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      { "<leader>st", function() require("colorscheme-persist").picker() end, desc = "Pick a colorscheme" },
    },
    opts = {
      fallback = "catppuccin-mocha",
      enable_preview = true,
      -- hide the colorschemes bundled with nvim itself
      disable = vim.tbl_map(function(file)
        return vim.fn.fnamemodify(file, ":t:r")
      end, vim.list_extend(
        vim.fn.globpath(vim.env.VIMRUNTIME, "colors/*.vim", false, true),
        vim.fn.globpath(vim.env.VIMRUNTIME, "colors/*.lua", false, true)
      )),
    },
    config = function(_, opts)
      -- transparent background, reapplied on every theme change
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("user_transparent_bg", { clear = true }),
        callback = function()
          vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
      })
      require("colorscheme-persist").setup(opts)
    end,
  },
}
