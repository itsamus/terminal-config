
--                                        _ _ _
--                    ___  ___ _ __ ___ | | | |__   __ _ _ __    __       _
--                   / __|/ __| '__/ _ \| | | '_ \ / _` | '__|  / / ___ _(_)_ __
--                   \__ \ (__| | | (_) | | | |_) | (_| | |    / / ' \ V / | '  \
--                   |___/\___|_|  \___/|_|_|_.__/ \__,_|_|   /_/|_||_\_/|_|_|_|_|
--  ===============================================================================================
--  TITLE : scrollbar.lua
--  ABOUT : a scrollbar in nvim
--  LINKS : https://github.com/wsdjeg/scrollbar.nvim
--  ===============================================================================================

    return {
        "wsdjeg/scrollbar.vim",
    	event = "VeryLazy",
	    config = function()
            vim.cmd("highlight Scrollbar guifg=#FF0033 ctermbg=NONE")
            require("scrollbar").setup({
                shape = {
                    head = "▲",
                    body = "█",
                    tail = "▼",
                },
            highlight = {
                head  = "Scrollbar",
                body  = "Scrollbar",
                tail  = "Scrollbar",
            },
	    max_size = 10,
            min_size = 5,
            width    = 1,
            right_offset       = 1,
            excluded_filetypes = {},
        })
        end,
    }

