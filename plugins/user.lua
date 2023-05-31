local neodo_cmake_conf = {
  name = "CMake",
  commands = {
    generate = {
      type = "command",
      name = "Generate CMake project files",
      cmd = "./gen.sh",
    },
    build = {
      type = "command",
      name = "Build CMake project",
      cmd = "./build.sh",
    },
    run = {
      type = "command",
      name = "Run CMake project",
      cmd = "./run.sh",
    },
    patterns = { 'CMakeLists.txt' },
    buffer_on_attach = function()
      local opts = { noremap = true, silent = true }
      vim.api.nvim_buf_set_keymap(0, "n", "<F5>", "<cmd>lua require('neodo').run()<cr>", opts)
      vim.api.nvim_buf_set_keymap(0, "n", "<C-B>", "<cmd>lua require('neodo').build()<cr>", opts)
    end
  }
}

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "User AstroFile",
    cmd = { "TodoQuickFix", "TodoLocList", "TodoTelescope", "TodoTrouble" },
    keys = {
      { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" }
    }
  },
  {
    "p00f/clangd_extensions.nvim", -- install lsp plugin
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "clangd" }, -- automatically install lsp
      },
    },
  },
  -- {
  --   "JanValiska/neodo.nvim",
  --   opts = {
  --     project_type = {
  --       cmake = neodo_cmake_conf,
  --     }
  --   }
  -- }
}
