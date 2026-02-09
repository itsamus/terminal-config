
--                                _       _ _
--                               (_)_ __ (_) |_      _
--                               | | '_ \| | __|    | |_  _ __ _
--                               | | | | | | |_    _| | || / _` |
--                               |_|_| |_|_|\__|  (_)_|\_,_\__,_|
--  ===============================================================================================
    require("config.lazy")

    -- Function to ensure blank lines at the start and end of the buffer
    local function ensure_blank_lines()
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

        -- Ensure blank line at the start
        if #lines > 0 and lines[1] ~= "" then
            vim.api.nvim_buf_set_lines(0, 0, 0, false, {""})
        elseif #lines == 0 then
            -- If the file is empty, add a blank line
            vim.api.nvim_buf_set_lines(0, 0, 0, false, {""})
        end

    -- Re-fetch lines after potential modification
    lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    -- Ensure blank line at the end
    if #lines > 0 and lines[#lines] ~= "" then
        vim.api.nvim_buf_set_lines(0, #lines, #lines, false, {""})
    elseif #lines == 0 then
        -- This case is already covered by the start check if the file was empty
        -- but ensures robustness if somehow it's still empty.
        vim.api.nvim_buf_set_lines(0, 0, 0, false, {""})
    end
    end

    -- Autocommands to apply the function
    vim.api.nvim_create_autocmd({"BufNewFile", "BufReadPost"}, {
        pattern = "*",
        callback = function()
        ensure_blank_lines()
        end
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
        ensure_blank_lines()
        end
    })

