
--                        _                           _
--             __ _ _   _| |_ ___   ___ _ __ ___   __| |___      __       _
--            / _` | | | | __/ _ \ / __| '_ ` _ \ / _` / __|    / / ___ _(_)_ __
--           | (_| | |_| | || (_) | (__| | | | | | (_| \__ \   / / ' \ V / | '  \
--            \__,_|\__,_|\__\___/ \___|_| |_| |_|\__,_|___/  /_/|_||_\_/|_|_|_|_|
--  ================================================================================================
--  TITLE : auto-commands
--  ABOUT : automatically run code on defined events (e.g. save, yank)
--  LINK : -
--  ================================================================================================

--  ---[ Restore last cursor position when reopening a file ]------------------------------------///
    local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
    vim.api.nvim_create_autocmd("BufReadPost", {
	    group = last_cursor_group,
    	callback = function()
	    	local mark = vim.api.nvim_buf_get_mark(0, '"')
	    	local lcount = vim.api.nvim_buf_line_count(0)
	    	if mark[1] > 0 and mark[1] <= lcount then
		    	pcall(vim.api.nvim_win_set_cursor, 0, mark)
		    end
	    end,
    })
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Highlight the yanked text for 200ms ]---------------------------------------------------///
    local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
    vim.api.nvim_create_autocmd("TextYankPost", {
    	group = highlight_yank_group,
    	pattern = "*",
    	callback = function()
	    	vim.hl.on_yank({
		    	higroup = "IncSearch",
			    timeout = 500,
		    })
	    end,
    })
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Function to ensure blank lines at the start and end of the buffer ]---------------------///
    local function ensure_blank_lines()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    if #lines > 0 and lines[1] ~= "" then
        vim.api.nvim_buf_set_lines(0, 0, 0, false, {""})
    elseif #lines == 0 then
        vim.api.nvim_buf_set_lines(0, 0, 0, false, {""})
    end
    lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    if #lines > 0 and lines[#lines] ~= "" then
        vim.api.nvim_buf_set_lines(0, #lines, #lines, false, {""})
    elseif #lines == 0 then
        vim.api.nvim_buf_set_lines(0, 0, 0, false, {""})
    end
    end
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
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Create a second tab for the cheatsheet ]------------------------------------------------///
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            -- Open een nieuwe tab
            vim.cmd("tabnew")
            -- Open het bestand in de huidige (nieuwe) tab
            vim.cmd("edit ~/.help/cheatsheet-nvim.sh")
            -- Ga terug naar de eerste tab zodat je direct kunt werken
            vim.cmd("tabfirst")
        end,
    })
    vim.api.nvim_create_autocmd("TabClosed", {
        callback = function()
            -- Controleer hoeveel tabbladen er nog over zijn
            if vim.fn.tabpagenr('$') == 1 then
                -- Haal de naam op van het bestand in het laatste tabblad
                local last_buf_name = vim.api.nvim_buf_get_name(0)
                -- Als dit de cheatsheet is, sluit dan heel Neovim
                if last_buf_name:match("cheatsheet%-nvim.sh") then
                    vim.cmd("quit")
                end
            end
        end,
    })
--  ---------------------------------------------------------------------------------------------\\\

