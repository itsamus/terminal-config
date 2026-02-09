
--                                  __     __
--                                 / _|___/ _|     __       _
--                                | ||_  / |_     / / ___ _(_)_ __
--                                |  _/ /|  _|   / / ' \ V / | '  \
--                                |_|/___|_|    /_/|_||_\_/|_|_|_|_|
--  ===============================================================================================
--  TITLE : fzf-lua.lua
--  ABOUT : fzf integration in nvim
--  LINKS : https://github.com/ibhagwan/fzf-lua
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
--return {
--    "ibhagwan/fzf-lua",
--    lazy = false,
--    dependencies = { "nvim-tree/nvim-web-devicons" },
--    keys = {
--        { "<leader>ff", function() require("fzf-lua").files() end, desc = "FZF Files" },
--        { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "FZF Live Grep" },
--        { "<leader>fb", function() require("fzf-lua").buffers() end, desc = "FZF Buffers" },
--        { "<leader>fh", function() require("fzf-lua").help_tags() end, desc = "FZF Help Tags" },
--        { "<leader>fx", function() require("fzf-lua").diagnostics_document() end, desc = "FZF Diagnostics Document" },
--        { "<leader>fX", function() require("fzf-lua").diagnostics_workspace() end, desc = "FZF Diagnostics Workspace" },
--        { "<leader>fs", function() require("fzf-lua").lsp_document_symbols() end, desc = "FZF Document Symbols" },
--        { "<leader>FS", function() require("fzf-lua").lsp_workspace_symbols() end, desc = "FZF Workspace Symbols" },
--    },
--    opts = function()
--        local fzf = require("fzf-lua")
--
--        -- Shell command functie
--        local shell_execute = function(selected, opts)
--            if not selected or #selected == 0 then return end
--            -- Converteer de fzf selectie naar een bruikbaar pad
--            local entry = fzf.path.entry_to_file(selected[1], opts)
--            local full_path = vim.fn.fnamemodify(entry.path, ":p")
--
--            vim.ui.input({
--                prompt = "Enter Shell Command ($f = file): ",
--                default = "",
--            }, function(input)
--                if not input or input == "" then return end
--                local cmd = input:gsub("$f", vim.fn.shellescape(full_path))
--                vim.cmd("redraw") -- Voorkom UI glitches na de prompt
--                local output = vim.fn.system(cmd)
--                if output ~= "" then print(output) else print("Executed: " .. cmd) end
--            end)
--        end
--
--        return {
--            -- Gebruik 'default' voor globale acties (zoals '!')
--            actions = {
--                files = {
--                    -- Behoud standaard acties en voeg onze acties toe
--                    ["default"] = fzf.actions.file_edit_or_qf,
--                    ["ctrl-s"]   = fzf.actions.file_split,
--                    ["ctrl-v"]   = fzf.actions.file_vsplit,
--                    ["ctrl-t"]   = fzf.actions.file_tabedit,
--                    ["ctrl-d"]   = fzf.actions.file_sel_to_dir,
--                    ["!"]       = shell_execute,
--                },
--                buffers = {
--                    ["default"] = fzf.actions.buf_edit,
--                    ["ctrl-s"]   = fzf.actions.buf_split,
--                    ["ctrl-v"]   = fzf.actions.buf_vsplit,
--                    ["ctrl-t"]   = fzf.actions.buf_tabedit,
--                    ["!"]       = shell_execute,
--                },
--            },
--            winopts = {
--                height = 0.85,
--                width = 0.80,
--                preview = {
--                    layout = "vertical",
--                    vertical = "up:45%",
--                },
--            },
--            -- Zorg dat we ook mappen kunnen zien in de files picker
--            files = {
--                fd_opts = [[--color=never --type f --type d --hidden --follow --exclude .git]],
--            }
--        }
--    end,
--}
--

