return {
  {
    "folke/neodev.nvim",
    opts = {},
  },
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")
      require("mason").setup()
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",  -- LSP for Lua language
          "pyright", -- LSP for Python
        }
      });
      -- Setup every needed language server in lspconfig
      mason_lspconfig.setup_handlers {
        function(server_name)
          lspconfig[server_name].setup({})
        end,
      }
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        name = {
          trailing_slash = true,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        window = {
          width = 30,
          mappings = {
            ["l"] = "open",
            ["h"] = "close_node",
          },
          filesystem = {
            filtered_items = {
              visible = true,
            },
            follow_current_file = true,
          },
        },
      })
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "cmake",
          "comment",
          "markdown",
          "python",
        },
        highlight = {
          enable = true,
          disable = {},
        },
        indent = {
          enable = true,
          disable = {},
        },
      })
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    style = "moon",
    config = function()
      vim.cmd([[colorscheme tokyonight-moon]])
    end
  }
}
