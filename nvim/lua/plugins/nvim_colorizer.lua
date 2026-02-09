
--                           _            _
--                  ___ ___ | | ___  _ __(_)_______ _ __    __       _
--                 / __/ _ \| |/ _ \| '__| |_  / _ \ '__|  / / ___ _(_)_ __
--                | (_| (_) | | (_) | |  | |/ /  __/ |    / / ' \ V / | '  \
--                 \___\___/|_|\___/|_|  |_/___\___|_|   /_/|_||_\_/|_|_|_|_|
--  ===============================================================================================
--  TITLE : nvim_colorizer.lua
--  ABOUT : add background colors to -HEX-codes
--  LINKS : https://github.com/norcalli/nvim-colorizer.lua
--  ===============================================================================================

    return {
        "norcalli/nvim-colorizer.lua",
		Event = "VeryLazy",
		config = function()
        vim.opt.termguicolors = true
		require('colorizer').setup({
            user_default_options = {
		        RGB = true,
                RRGGBB = true,
				names = true,
                RRGGBBAA = true,
				rgb_fn = true,
                hsl_fn = true,
				css = true,
                css_fn = true,
				mode = 'background',
		    },
		})
        vim.api.nvim_create_autocmd({"BufEnter", "BufReadPost"}, {
            group = vim.api.nvim_create_augroup("ColorizerAttach", { clear = true }),
            callback = function()
                vim.cmd("ColorizerAttachToBuffer")
            end,
        })
		end,
    }


