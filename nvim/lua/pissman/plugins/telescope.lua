return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- native fzf sorter: faster, supports fzf syntax ('exact ^prefix suffix$ !negate)
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({})
    pcall(telescope.load_extension, "fzf")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope git files" })
    vim.keymap.set("n", "<leader>ss", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "Telescope grep string" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope help tags" })
  end,
}
