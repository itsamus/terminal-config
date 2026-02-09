
--                                 _
--                                | |_ _ __ ___  ___      __       _
--                                | __| '__/ _ \/ _ \    / / ___ _(_)_ __
--                                | |_| | |  __/  __/   / / ' \ V / | '  \
--                                 \__|_|  \___|\___|  /_/|_||_\_/|_|_|_|_|
--  ===============================================================================================
--  TITLE : nvim-tree.lua
--  ABOUT : File explorer for nvim
--  LINKS : https://github.com/nvim-tree/nvim-tree.lua
--  ===============================================================================================

    return {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        config = function()
            vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
            local function my_on_attach(bufnr)
                local api = require("nvim-tree.api")
                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end
                api.config.mappings.default_on_attach(bufnr)
                vim.keymap.set("n", ">", function()
                    local node = api.tree.get_node_under_cursor()
                    if not node then return end
                    vim.ui.input({
                        prompt = "Enter Shell Command: ",
                        default = "",
                    }, function(input)
                        if not input or input == "" then return end
                        local cmd = input:gsub("$f", vim.fn.shellescape(node.absolute_path))
                        local output = vim.fn.system(cmd)
                        api.tree.reload()
                        if output ~= "" then print(output) else print("Executed: " .. cmd) end
                    end)
                end, opts("Run Shell Command"))
            end
            require("nvim-tree").setup({
                on_attach = my_on_attach, -- <--- Dit koppelt de functie aan de plugin
                filters = {
                    dotfiles = false,
                },
                view = {
                    adaptive_size = true,
                },
            })
        end,
    }

