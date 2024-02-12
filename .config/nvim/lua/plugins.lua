return {
	{ "nvim-lua/plenary.nvim" },
	{ "tpope/vim-fugitive", cmd = "Git", lazy = true },
	{ "junegunn/gv.vim", cmd = "Gv", dependencies = {"tpope/vim-fugitive"}, lazy = true },
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
			{ "<leader>ft", "<cmd>NvimTreeToggle<CR>", desc = "[f]ile browser [t]oggle" },
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
	            return vim.o.columns * 0.4
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
			{ "<leader>t<DOWN>", ":ToggleTerm direction=horizontal<CR>", desc = "New terminal on bottom" },
			{ "<leader>t<RIGHT>", ":ToggleTerm direction=vertical<CR><C-\\><C-n>:set nocul<CR>i", desc = "New terminal on right" },
			{ "<leader>t<TAB>", ":ToggleTerm direction=float<CR>", desc = "New floating terminal" },
			{ "<leader>tt", ":ToggleTerm direction=tab<CR>", desc = "New terminal in tab" },
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
				"c",
				"cpp",
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
				"ruby",
				"rust",
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
			require("harpoon").setup({
				extensions = {
				}
			})
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
	{ "aymericbeaumet/vim-symlink" },
	{
		"nvim-telescope/telescope.nvim", tag = '0.1.5',
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<Esc>"] = require("telescope.actions").close, -- don't go into normal mode, just close
							["<C-j>"] = require("telescope.actions").move_selection_next, -- scroll the list with <c-j>
							["<C-k>"] = require("telescope.actions").move_selection_previous, -- scroll the list with <c-k>
							["<C-t>"] = require("telescope.actions").select_tab, -- open selection in new tab
							["<C-y>"] = require("telescope.actions").preview_scrolling_up,
							["<C-e>"] = require("telescope.actions").preview_scrolling_down,
			            },
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--trim",
					},
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8 },
						vertical = { mirror = false },
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					file_ignore_patterns = { "node_modules" },
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = { "truncate" },
					winblend = 0,
					border = {},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
					use_less = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					-- Developer configurations: Not meant for general override
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				},
				pickers = { find_files = { find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" } } },
				extensions = {
					fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case" },
				},
			})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"sharkdp/fd",
		},
	},
	{
		"startup-nvim/startup.nvim",
		requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
		config = function()
			require("startup").setup({theme = "folk"})
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
}
