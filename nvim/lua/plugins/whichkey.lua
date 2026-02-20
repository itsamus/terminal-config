
--                           _     _      _     _              	
--                 __      _| |__ (_) ___| |__ | | _____ _   _      __       _       
--                 \ \ /\ / / '_ \| |/ __| '_ \| |/ / _ \ | | |    / / ___ _(_)_ __  
--                  \ V  V /| | | | | (__| | | |   <  __/ |_| |   / / ' \ V / | '  \ 
--                   \_/\_/ |_| |_|_|\___|_| |_|_|\_\___|\__, |  /_/|_||_\_/|_|_|_|_|
--                                                       |___/ 	                    
--  ================================================================================================
--  TITLE : whichkey.lua
--  ABOUT : Plugin to remember nvim keymaps by showing them as you type
--  LINKS : https://github.com/folke/which-key.nvim
--  FILES : -
--  TAGS  : [[plugin-nvim]]
--  ===============================================================================================

    return {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    }

