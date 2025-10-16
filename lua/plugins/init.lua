return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- nvim-tree 配置
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        -- 显示重要的配置文件，比如 .gitignore、.env 等
        dotfiles = false,
        custom = { 
          "*.meta", 
          "*.tmp",
        },
      }
    }
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "seblyng/roslyn.nvim",
    opts = {
        -- your configuration comes here; leave empty for default settings
    },
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
