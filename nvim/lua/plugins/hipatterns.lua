
--            _     _             _   _
--           | |__ (_)_ __   __ _| |_| |_ ___ _ __ _ __  ___      __       _
--           | '_ \| | '_ \ / _` | __| __/ _ \ '__| '_ \/ __|    / / ___ _(_)_ __
--           | | | | | |_) | (_| | |_| ||  __/ |  | | | \__ \   / / ' \ V / | '  \
--           |_| |_|_| .__/ \__,_|\__|\__\___|_|  |_| |_|___/  /_/|_||_\_/|_|_|_|_|
--                   |_|
--  ===============================================================================================
--  TITLE : hipatterns.lua
--  ABOUT : colorize text patterns in nvim (comments)
--  LINKS :
--  ===============================================================================================

    return {
        "echasnovski/mini.hipatterns",
        config = function()
            local hipatterns = require("mini.hipatterns")

            hipatterns.setup({
                highlighters = {
                    -- 1. De Tags zelf (voor de felle achtergrondkleur)
                    todo_tag = { pattern = "()TODO()", group = "MiniHipatternsTodoTag" },
                    note_tag = { pattern = "()NOTE()", group = "MiniHipatternsNoteTag" },
                    warn_tag = { pattern = "()WARN()", group = "MiniHipatternsWarnTag" },

                    -- 2. De paraaf logica
                    paraaf_block = {
                        pattern = "^%s*#.*$",
                        group = function(bufnr, _, data)
                            local line_num = data.line
                            local lines = vim.api.nvim_buf_get_lines(bufnr, 0, line_num, false)

                            -- Loop terug om te kijken bij welk blok deze regel hoort
                            for i = #lines, 1, -1 do
                                local current_line = lines[i]

                                -- Prioriteit: als we TODO vinden, wordt het hele blok TODO-geel
                                if current_line:find("TODO") then
                                    return "MiniHipatternsTodoBlock"
                                end
                                -- Als we NOTE vinden, wordt het hele blok NOTE-blauw
                                if current_line:find("NOTE") then
                                    return "MiniHipatternsNoteBlock"
                                end
                                -- Als we WARN vinden, wordt het hele blok WARN-blauw
                                if current_line:find("WARN") then
                                    return "MiniHipatternsWarnBlock"
                                end

                                -- Stop de zoektocht als we een regel tegenkomen die geen comment (#) is
                                -- Dit zorgt ervoor dat de kleur stopt bij een witregel
                                if not current_line:find("^%s*#") then
                                    break
                                end
                            end
                            return nil
                        end,
                    },
                },
            })

            -- Kleuren voor TODO (Geel/Oranje)
            vim.api.nvim_set_hl(0, "MiniHipatternsTodoTag", { fg = "#000000", bg = "#fabd2f", bold = true })
            vim.api.nvim_set_hl(0, "MiniHipatternsTodoBlock", { fg = "#fabd2f" })

            -- Kleuren voor NOTE (Blauw/Cyaan)
            -- Ik heb hier een mooie blauwe tint gekozen, maar die kun je uiteraard aanpassen
            vim.api.nvim_set_hl(0, "MiniHipatternsNoteTag", { fg = "#000000", bg = "#9900FF", bold = true })
            vim.api.nvim_set_hl(0, "MiniHipatternsNoteBlock", { fg = "#9900FF" })

            -- Kleuren voor WARN (Geel/Oranje)
            vim.api.nvim_set_hl(0, "MiniHipatternsWarnTag", { fg = "#000000", bg = "#FD4D5D", bold = true })
            vim.api.nvim_set_hl(0, "MiniHipatternsWarnBlock", { fg = "#FD4D5D" })

        end,
    }

