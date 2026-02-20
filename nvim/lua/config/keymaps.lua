
--                   _                                        	
--                  | | _____ _   _ _ __ ___   __ _ _ __  ___      __       _       
--                  | |/ / _ \ | | | '_ ` _ \ / _` | '_ \/ __|    / / ___ _(_)_ __  
--                  |   <  __/ |_| | | | | | | (_| | |_) \__ \   / / ' \ V / | '  \ 
--                  |_|\_\___|\__, |_| |_| |_|\__,_| .__/|___/  /_/|_||_\_/|_|_|_|_|
--                            |___/                |_|        	                    
--  ================================================================================================
--  TITLE : keymaps.lua
--  ABOUT : Some quality of life keybindings for nvim
--  LINKS : -
--  FILES : - 
--  TAGS  : [[system]] [[nvim]] [[editor]]
--  ================================================================================================

    local keymap = vim.keymap.set

--  ---[ Normal mode      ]----------------------------------------------------------------------///
--  --------------------------[ Splits           ]-----------------------------------------------///
    keymap('n', 'gf', ':silent !tmux split-window -h nvim <cfile><CR>', { desc = "Open file under cursor in tmux vertical split" })
    keymap("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
    keymap("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Buffer Navigation ]----------------------------------------------///
--    keymap("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "Next buffer" })
--    keymap("n", "<leader>bp", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Leader key       ]-----------------------------------------------///
    keymap('n', '<leader>1', ':-1read $HOME/.config/nvim/lua/snippets/fold1.nvim<CR>f[lli', { noremap = true, silent = true })
    keymap('n', '<leader>2', ':-1read $HOME/.config/nvim/lua/snippets/fold2.nvim<CR>f[lli', { noremap = true, silent = true })
    keymap('n', '<leader>3', ':-1read $HOME/.config/nvim/lua/snippets/fold3.nvim<CR>f[lli', { noremap = true, silent = true })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Folds            ]-----------------------------------------------///
    keymap("n", "zO", "zR",  {noremap = true, silent = true, desc = "Open all folds" })
    keymap("n", "zC", "zM",  {noremap = true, silent = true, desc = "Close all folds" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Center screen when jumping ]-------------------------------------///
    keymap("n", "n", "nzzzv", { desc = "Next search result (centered)" })
    keymap("n", "?", "Nzzzv", { desc = "Previous search result (centered)" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Shell keybindings ]----------------------------------------------///
    keymap("n", "<C-A>", "I", { desc = "Beginning of line" })
    keymap("n", "<C-E>", "A", { desc = "End of line" })
    keymap("n", "<leader>+x", "<cmd>! chmod +x %<CR>", { silent = true, desc = "Make file executable" })
--  ---------------------------------------------------------------------------------------------\\\
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Insert Mode      ]----------------------------------------------------------------------///
--  --------------------------[ Shell keybindings ]----------------------------------------------///
    keymap("i", "<C-a>", "<Home>", { desc = "Go to beginning of line" })
    keymap("i", "<C-e>", "<End>", { desc = "Go to end of line" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Exiting           ]----------------------------------------------///
--    keymap("i", "<C-q>", "<Esc>", { desc = "Exit insert mode" })
    keymap("i", "<C-q>", function()
        vim.cmd("stopinsert")
        local choice = vim.fn.confirm("Save changes?", "&Yes\n&No\n&Cancel", 1)
        if choice == 1 then
            vim.cmd("wq") -- Yes: Save and Quit
        elseif choice == 2 then
            vim.cmd("q!") -- No: Quit!
        end
    end, { desc = "Prompt to save and quit from insert mode" })

--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Shift select text ]----------------------------------------------///
    keymap("i", '<S-Left>', '<Esc>v<Left>', {noremap = true, silent = true, desc = 'Visual select left'})
    keymap("i", '<S-Right>', '<Esc>v<Right>', {noremap = true, silent = true, desc = 'Visual select right'})
--  ---------------------------------------------------------------------------------------------\\\
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Visual Mode      ]----------------------------------------------------------------------///
--  --------------------------[ Moving lines     ]-----------------------------------------------///
    keymap("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "move lines UP in VISUAL selection"})
    keymap("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "move lines DOWN in VISUAL selection"})
--  ---------------------------------------------------------------------------------------------\\\
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Command mode     ]----------------------------------------------------------------------///
    keymap('c', 'Q', 'q', { noremap = true, silent = true })
    keymap('c', 'V', 'v', { noremap = true, silent = true })
    keymap("c", "she", "<C-u>put! = '    #!/usr/bin/env bash'<CR>", { desc = "Add a Shebang" })
--  --------------------------[ Comment-block: TODO ]--------------------------------------------///
    local function insert_todo_block()
        vim.ui.input({ prompt = "TODO-block (\\n supported)" }, function(input)
            if not input or input == "" then return end
    
            local start_col = 76
            local max_col = 116
            local prefix = string.rep(" ", start_col - 1) .. "#  "
            -- De lege commentaarregel om de paraaf-kleur te behouden
            local empty_comment = string.rep(" ", start_col - 1) .. "#"
            local max_width = max_col - #prefix
    
            local lines = {}
            -- 1. De vaste koppen
            table.insert(lines, string.rep(" ", start_col - 1) .. "#   TODO            TODO            TODO")
            table.insert(lines, string.rep(" ", start_col - 1) .. "# ════════════════════════════════════════")
    
            -- 2. Wrapper functie
            local function wrap_section(text, width)
                if text:match("^%s*$") then return { empty_comment } end
                local res = {}
                local current_line = ""
                for word in text:gmatch("%S+") do
                    if #current_line + #word + 1 > width then
                        table.insert(res, prefix .. current_line)
                        current_line = word
                    else
                        current_line = current_line == "" and word or current_line .. " " .. word
                    end
                end
                if current_line ~= "" then table.insert(res, prefix .. current_line) end
                return res
            end
    
            -- 3. Splitsen op \n inclusief lege secties
            -- We gebruiken een pattern dat ook lege strings tussen \n vindt
            local last_pos = 1
            for s, e in input:gmatch("()\\n()") do
                local section = input:sub(last_pos, s - 1)
                local wrapped = wrap_section(section:gsub("^%s*(.-)%s*$", "%1"), max_width)
                for _, l in ipairs(wrapped) do table.insert(lines, l) end
                last_pos = e
            end
            -- Pak de laatste sectie na de laatste \n
            local last_section = input:sub(last_pos)
            local wrapped = wrap_section(last_section:gsub("^%s*(.-)%s*$", "%1"), max_width)
            for _, l in ipairs(wrapped) do table.insert(lines, l) end
    
            -- 4. Plaatsen in de buffer
            local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
            vim.api.nvim_buf_set_lines(0, row, row, false, lines)
        end)
    end
    vim.api.nvim_create_user_command("TB", insert_todo_block, { desc = "Genereer TODO blok" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Comment-block: NOTE ]--------------------------------------------///
    local function insert_note_block()
        vim.ui.input({ prompt = "NOTE-block (\\n supported)" }, function(input)
            if not input or input == "" then return end
    
            local start_col = 76
            local max_col = 116
            local prefix = string.rep(" ", start_col - 1) .. "#  "
            -- De lege commentaarregel om de paraaf-kleur te behouden
            local empty_comment = string.rep(" ", start_col - 1) .. "#"
            local max_width = max_col - #prefix
    
            local lines = {}
            -- 1. De vaste koppen
            table.insert(lines, string.rep(" ", start_col - 1) .. "#   NOTE            NOTE            NOTE")
            table.insert(lines, string.rep(" ", start_col - 1) .. "# ════════════════════════════════════════")
    
            -- 2. Wrapper functie
            local function wrap_section(text, width)
                if text:match("^%s*$") then return { empty_comment } end
                local res = {}
                local current_line = ""
                for word in text:gmatch("%S+") do
                    if #current_line + #word + 1 > width then
                        table.insert(res, prefix .. current_line)
                        current_line = word
                    else
                        current_line = current_line == "" and word or current_line .. " " .. word
                    end
                end
                if current_line ~= "" then table.insert(res, prefix .. current_line) end
                return res
            end
    
            -- 3. Splitsen op \n inclusief lege secties
            -- We gebruiken een pattern dat ook lege strings tussen \n vindt
            local last_pos = 1
            for s, e in input:gmatch("()\\n()") do
                local section = input:sub(last_pos, s - 1)
                local wrapped = wrap_section(section:gsub("^%s*(.-)%s*$", "%1"), max_width)
                for _, l in ipairs(wrapped) do table.insert(lines, l) end
                last_pos = e
            end
            -- Pak de laatste sectie na de laatste \n
            local last_section = input:sub(last_pos)
            local wrapped = wrap_section(last_section:gsub("^%s*(.-)%s*$", "%1"), max_width)
            for _, l in ipairs(wrapped) do table.insert(lines, l) end
    
            -- 4. Plaatsen in de buffer
            local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
            vim.api.nvim_buf_set_lines(0, row, row, false, lines)
        end)
    end
    vim.api.nvim_create_user_command("NB", insert_note_block, { desc = "Genereer NOTE blok" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Comment-block: WARN ]--------------------------------------------///
    local function insert_warn_block()
        vim.ui.input({ prompt = "WARN-block (\\n supported)" }, function(input)
            if not input or input == "" then return end
    
            local start_col = 76
            local max_col = 116
            local prefix = string.rep(" ", start_col - 1) .. "#  "
            -- De lege commentaarregel om de paraaf-kleur te behouden
            local empty_comment = string.rep(" ", start_col - 1) .. "#"
            local max_width = max_col - #prefix
    
            local lines = {}
            -- 1. De vaste koppen
            table.insert(lines, string.rep(" ", start_col - 1) .. "#   WARN            WARN            WARN")
            table.insert(lines, string.rep(" ", start_col - 1) .. "# ════════════════════════════════════════")
    
            -- 2. Wrapper functie
            local function wrap_section(text, width)
                if text:match("^%s*$") then return { empty_comment } end
                local res = {}
                local current_line = ""
                for word in text:gmatch("%S+") do
                    if #current_line + #word + 1 > width then
                        table.insert(res, prefix .. current_line)
                        current_line = word
                    else
                        current_line = current_line == "" and word or current_line .. " " .. word
                    end
                end
                if current_line ~= "" then table.insert(res, prefix .. current_line) end
                return res
            end
    
            -- 3. Splitsen op \n inclusief lege secties
            -- We gebruiken een pattern dat ook lege strings tussen \n vindt
            local last_pos = 1
            for s, e in input:gmatch("()\\n()") do
                local section = input:sub(last_pos, s - 1)
                local wrapped = wrap_section(section:gsub("^%s*(.-)%s*$", "%1"), max_width)
                for _, l in ipairs(wrapped) do table.insert(lines, l) end
                last_pos = e
            end
            -- Pak de laatste sectie na de laatste \n
            local last_section = input:sub(last_pos)
            local wrapped = wrap_section(last_section:gsub("^%s*(.-)%s*$", "%1"), max_width)
            for _, l in ipairs(wrapped) do table.insert(lines, l) end
    
            -- 4. Plaatsen in de buffer
            local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
            vim.api.nvim_buf_set_lines(0, row, row, false, lines)
        end)
    end
    vim.api.nvim_create_user_command("WB", insert_warn_block, { desc = "Genereer WARN blok" })
--  ---------------------------------------------------------------------------------------------\\\
--  ---------------------------------------------------------------------------------------------\\\

