
--                                  __     __
--                                 / _|___/ _|     __       _
--                                | ||_  / |_     / / ___ _(_)_ __
--                                |  _/ /|  _|   / / ' \ V / | '  \
--                                |_|/___|_|    /_/|_||_\_/|_|_|_|_|
--  ===============================================================================================
--  TITLE : fzf-lua.lua
--  ABOUT : fzf integration in nvim
--  LINKS : https://github.com/ibhagwan/fzf-lua
--  FILES : -
--  TAGS  : #nvim #system #editor
--  ===============================================================================================

    return {
        "ibhagwan/fzf-lua",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {
                "<leader>ff",
                function()
                    require("fzf-lua").files()
                end,
                desc = "FZF Files",
            },
            {
                "<leader>fg",
                function()
                    require("fzf-lua").live_grep()
                end,
                desc = "FZF Live Grep",
            },
            {
                "<leader>fb",
                function()
                    require("fzf-lua").buffers()
                end,
                desc = "FZF Buffers",
            },
            {
                "<leader>fh",
                function()
                    require("fzf-lua")help_tags()
                end,
                desc = "FZF Help Tags",
            },
            {
                "<leader>fx",
                function()
                    require("fzf-lua").diagnostics_documents()
                end,
                desc = "FZF Diagnostics Document",
            },
            {
                "<leader>fX",
                function()
                    require("fzf-lua").diagnostica_workspace()
                end,
                desc = "FZF Diagnostics Workspace",
            },
            {
                "<leader>fs",
                function()
                    require("fzf-lua").lsp_document_symbols()
                end,
                desc = "FZF Document Symbols",
            },
            {
                "<leader>FS",
                function()
                    require("fzf-lua").lsp_workspace_symbols()
                end,
                desc = "FZF Workspace Symbols",
            },
        },
        opts = {},
    }

