

--        ___ _ __ ___   ___  __ _ _ __       ___ _   _ _ __ ___  ___  _ __    __       _
--       / __| '_ ` _ \ / _ \/ _` | '__|____ / __| | | | '__/ __|/ _ \| '__|  / / ___ _(_)_ __
--       \__ \ | | | | |  __/ (_| | | |_____| (__| |_| | |  \__ \ (_) | |    / / ' \ V / | '  \
--       |___/_| |_| |_|\___|\__,_|_|        \___|\__,_|_|  |___/\___/|_|   /_/|_||_\_/|_|_|_|_|
--  ===============================================================================================
--  TITLE : smear_cursor.lua
--  ABOUT : Eye candy for the nvim cursor
--  LINKS : https://github.com/sphamba/smear-cursor.nvim/tree/main/lua/smear_cursor
--  ===============================================================================================

    return {
        "sphamba/smear-cursor.nvim",
        opts = {
            -- Smear cursor when switching buffers or windows.
            smear_between_buffers = true,

            -- Smear cursor when moving within line or to neighbor lines.
            -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
            smear_between_neighbor_lines = true,

            -- Draw the smear in buffer space instead of screen space when scrolling
            scroll_buffer_space = true,

            -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
            -- Smears and particles will look a lot less blocky.
            legacy_computing_symbols_support = false,

            -- Smear cursor in insert mode.
            -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
            smear_insert_mode = true,

            -- Smear cursor color. Defaults to Cursor GUI color if not set.
            -- Set to "none" to match the text color at the target cursor position.
            -- Can be a hex color code, or a highlight group name.
            cursor_color = "#FF0033",
    	                                       -- Default  -- Range
            stiffness = 0.9,                       -- 0.6        [0, 1]
            trailing_stiffness = 0.35,             -- 0.45       [0, 1]
            stiffness_insert_mode = 0.9,           -- 0.5        [0, 1]
            trailing_stiffness_insert_mode = 0.35, -- 0.5        [0, 1]
            damping = 0.6,                         -- 0.85       [0, 1]
            damping_insert_mode = 0.6,             -- 0.9        [0, 1]
            distance_stop_animating = 0.5,         -- 0.1          > 0
        },
    }

