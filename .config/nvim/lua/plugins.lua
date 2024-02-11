return {
	{ "nvim-lua/plenary.nvim" },
	{ "tpope/vim-fugitive", cmd = "Git", lazy = true },
	{ "junegunn/gv.vim", cmd = "GV", dependencies = {"tpope/vim-fugitive"}, lazy = true},
	{
		"nvim-tree/nvim-tree.lua",
 		version = "*",
 		lazy = false,
 		dependencies = {
 		  "nvim-tree/nvim-web-devicons",
 		},
 		config = function()
 		  require("nvim-tree").setup {}
 		end,
		keys = {
			{ "<leader>fb", "<cmd>NvimTreeToggle<CR>", desc = "[f]ile [b]rowser toggle" },
		},
	},
	{ 'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
		},
	},
	{
	    "akinsho/toggleterm.nvim", -- terminal in vim you can send code to
	    config = function()
		  -- tweak the sizes of the new terminal
	      require("toggleterm").setup({
	        size = function(term)
	          if term.direction == "horizontal" then
	            return 15
	          elseif term.direction == "vertical" then
	            return vim.o.columns * 0.5
	          end
	        end,
	      })
	      -- Always use insert mode when entering a terminal buffer, even with mouse click.
	      -- NOTE: Clicking with a mouse a second time enters visual select mode, just like in a text buffer.
	      vim.api.nvim_create_autocmd("BufEnter", {
	        pattern = "*",
	        callback = function()
	          vim.cmd("if &buftype == 'terminal' | startinsert | endif")
	        end,
	      })
	
	    end,
	    keys = {
	      { "gxx", ":ToggleTermSendCurrentLine<CR><CR>", desc = "Send current line to terminal" },
	      { "gx", ":ToggleTermSendVisualSelection<CR>'><CR>", desc = "Send selection to terminal", mode = "x" },
	      {
	        "<leader>cd",
	        "/```{r<CR>NjV/```<CR>k<Esc>:ToggleTermSendVisualSelection<CR>/```{r<CR>",
	        desc = "Send RMarkdown chunk to R",
	      },
	      -- Immiedately after creating the terminal, disable the cursorline.
	      -- This otherwise looks confusing with a single, differently-colored line at
	      -- the bottom of the terminal when commands are running.
	      { "<leader>t", ":ToggleTerm direction=vertical<CR><C-\\><C-n>:set nocul<CR>i", desc = "New terminal on right" },
		},
	},
    {
	    "nvim-treesitter/nvim-treesitter", -- sophisticated syntax highlighting and code inspection
	    version = false,
	    build = ":TSUpdate",
	    event = { "BufReadPost", "BufNewFile" },
	    config = function()
	      require("nvim-treesitter.configs").setup({
	        highlight = {
	          enable = true,
	        },
	        indent = {
	          enable = true,
	          disable = { "python", "snakemake" }, -- let vim-python-pep8-indent handle this
	        },
	        -- These will be attempted to be installed automatically, but you'll need a C compiler installed.
	        ensure_installed = {
	          "bash",
	          "css",
	          "dockerfile",
	          "html",
	          "json",
	          "lua",
	          "markdown",
	          "markdown_inline",
	          "python",
	          "vim",
	          "yaml",
	          "r",
	          "snakemake",
	        },
	        incremental_selection = {
	          enable = true,
	          keymaps = {
	            init_selection = "<leader>cs",
	            node_incremental = "<Tab>",
	            scope_incremental = false,
	            node_decremental = "<S-Tab>",
	          },
	        },
	      })
	      vim.cmd("set foldmethod=expr")
	      vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
	      vim.cmd("set nofoldenable")
	
	      -- RMarkdown doesn't have a good treesitter parser, but Markdown does
	      vim.treesitter.language.register("markdown", "rmd")
	      vim.treesitter.language.register("markdown", "rmarkdown")
		end,
	},
	{ "nordtheme/vim", },
	{ 
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim", -- status line along the bottom
		config = true,
		opts = { options = { theme = "nord" } },
	},
	{ "daler/vim-python-pep8-indent", ft = { "python", "snakemake" } },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
}
