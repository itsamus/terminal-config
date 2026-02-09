
--                             _        _
--                            | |_ _ __(_)_ __ ___       __       _
--                            | __| '__| | '_ ` _ \     / / ___ _(_)_ __
--                            | |_| |  | | | | | | |   / / ' \ V / | '  \
--                             \__|_|  |_|_| |_| |_|  /_/|_||_\_/|_|_|_|_|
--  ===============================================================================================
--  Title : Trim.lua
--  ABOUT : Trim whitelines and trailing spaces in documents
--  LINKS : https://github.com/cappyzawa/trim.nvim
--  ===============================================================================================

    return {
        "cappyzawa/trim.nvim",
        config = function()
            require("trim").setup({
                ft_blocklist = {},
                patterns = { [[%s/\(\n\n\)\n\+/\1/]] },
                trim_on_write = true,
                trim_trailing = true,
                trim_last_line = false,
                trim_first_line = false,
                trim_current_line = true,
                highlight = false,
                highlight_bg = '#000000', -- or 'red'
                highlight_ctermbg = 'red',
                notifications = true,
            })
        end,
    }

