
--                     _         _                 _
--       __      _____| |__   __| | _____   __    (_) ___ ___  _ __  ___      __       _
--       \ \ /\ / / _ \ '_ \ / _` |/ _ \ \ / /____| |/ __/ _ \| '_ \/ __|    / / ___ _(_)_ __
--        \ V  V /  __/ |_) | (_| |  __/\ V /_____| | (_| (_) | | | \__ \   / / ' \ V / | '  \
--         \_/\_/ \___|_.__/ \__,_|\___| \_/      |_|\___\___/|_| |_|___/  /_/|_||_\_/|_|_|_|_|
--  ===============================================================================================
--  TITLE : webdev-icons.lua
--  ABOUT : Provides glyphs for plugins
--  LINKS : https://github.com/nvim-tree/nvim-web-devicons
--  ===============================================================================================

--    return { "nvim-tree/nvim-web-devicons", opts = {} }

    return {
        "nvim-tree/nvim-web-devicons",
        config = function()
        require("nvim-web-devicons").setup({
            -- your personal icons can go here (to override)
            override = {
                bash = {
                icon = "",
                color = "#428850",
                cterm_color = "65",
                name = "bash",
                },
            },
            -- globally enable different highlight colors per icon
            color_icons = true,
            -- globally enable default icons
            default = true,
            -- globally enable "strict" selection of icons
            strict = true,
            -- override blend value (0 makes icons opaque)
            blend = 0,
            -- overrides by filename
            override_by_filename = {
                [".gitignore"] = {
                icon = "",
                color = "#CC44FF",
                name = "Gitignore",
                },
            },
            -- overrides by extension
            override_by_extension = {
                ["log"] = {
                    icon = "",
                    color = "#81e043",
                    name = "Log",
                    },

            },
        })
        end,
    }


