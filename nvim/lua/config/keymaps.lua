
--                   _
--                  | | _____ _   _ _ __ ___   __ _ _ __  ___      __       _
--                  | |/ / _ \ | | | '_ ` _ \ / _` | '_ \/ __|    / / ___ _(_)_ __
--                  |   <  __/ |_| | | | | | | (_| | |_) \__ \   / / ' \ V / | '  \
--                  |_|\_\___|\__, |_| |_| |_|\__,_| .__/|___/  /_/|_||_\_/|_|_|_|_|
--                            |___/                |_|
--  ===============================================================================================
--  TITLE : keymaps.lua
--  ABOUT : Some quality of life keybindings for nvim
--  LINKS : ---
--  FILES :
--  TAGS  : #nvim #system #editor
--  ===============================================================================================

--
--  ---[ Normal Mode      ]----------------------------------------------------------------------///
vim.keymap.set('n', 'gf', '<C-w>gf', { noremap = true, silent = true, desc = "Open file under cursor in new tab" })
--  --------------------------[ Folds            ]-----------------------------------------------///
    vim.keymap.set("n", "zO", "zR",  {noremap = true, silent = true, desc = "Open all folds" })
    vim.keymap.set("n", "zC", "zM",  {noremap = true, silent = true, desc = "Close all folds" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Center screen when jumping ]-------------------------------------///
    vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
    vim.keymap.set("n", "?", "Nzzzv", { desc = "Previous search result (centered)" })
    vim.keymap.set("n", "<C-down>", "<C-d>zz", { desc = "Half page down (centered)" })
    vim.keymap.set("n", "<C-up>", "<C-u>zz", { desc = "Half page up (centered)" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Buffer Navigation ]----------------------------------------------///
--    vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "Next buffer" })
--    vim.keymap.set("n", "<leader>bp", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Better window navigation ]---------------------------------------///
    vim.keymap.set("n", "<A-left>", "<C-w>h", { desc = "Move to left window" })
--    vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
--    vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
    vim.keymap.set("n", "<A-right>", "<C-w>l", { desc = "Move to right window" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Splitting & Resizing ]-------------------------------------------///
    vim.keymap.set('c', 'spp', 'vsplit', { noremap = true, silent = true, nowait = true , desc = "Split window" })
    vim.keymap.set("n", "<leader>sv", "<Cmd>vsplit<CR>", { desc = "Split window vertically" })
    vim.keymap.set("n", "<leader>sh", "<Cmd>split<CR>", { desc = "Split window horizontally" })
--    vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
--    vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
    vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize -25<CR>", { desc = "Decrease window width" })
    vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize +25<CR>", { desc = "Increase window width" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Better J behavior ]----------------------------------------------///
    vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ File explorer    ]-----------------------------------------------///
    vim.keymap.set("n", "<leader>t", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Shell keybindings ]----------------------------------------------///
    vim.keymap.set("n", "<C-A>", "I", { desc = "Beginning of line" })
    vim.keymap.set("n", "<C-E>", "A", { desc = "End of line" })
    vim.keymap.set("n", "<leader>+x", "<cmd>! chmod +x %<CR>", { silent = true, desc = "Make file executable" })
--  ---------------------------------------------------------------------------------------------\\\
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Command Mode     ]----------------------------------------------------------------------///
    vim.keymap.set('c', 'Q', 'q', { noremap = true, silent = true })
    vim.keymap.set('c', 'V', 'v', { noremap = true, silent = true })
    vim.keymap.set("c", "she", "<C-u>put! = '    #!/usr/bin/env bash'<CR>", { desc = "Add a Shebang" })
    --  ---------------------------------------------------------------------------------------------\\\
--  ---[ Insert Mode      ]----------------------------------------------------------------------///

--  --------------------------[ Shell keybindings ]----------------------------------------------///
    vim.keymap.set("i", "<C-a>", "<Home>", { desc = "Go to beginning of line" })
    vim.keymap.set("i", "<C-e>", "<End>", { desc = "Go to end of line" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Exiting           ]----------------------------------------------///
--    vim.keymap.set("i", "<C-q>", "<Esc>", { desc = "Exit insert mode" })
    vim.keymap.set("i", "<C-q>", function()
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
    vim.keymap.set("i", '<S-Left>', '<Esc>v<Left>', {noremap = true, silent = true, desc = 'Visual select left'})
    vim.keymap.set("i", '<S-Right>', '<Esc>v<Right>', {noremap = true, silent = true, desc = 'Visual select right'})
--  ---------------------------------------------------------------------------------------------\\\
--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Visual Mode      ]----------------------------------------------------------------------///
--  --------------------------[Better indenting  ]-----------------------------------------------///
    vim.keymap.set("v", "<S-Left>", "<gv", { desc = "Indent left and reselect" })
    vim.keymap.set("v", "<S-Right>", ">gv", { desc = "Indent right and reselect" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Moving lines     ]-----------------------------------------------///
    vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "move lines UP in VISUAL selection"})
    vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "move lines DOWN in VISUAL selection"})
--  ---------------------------------------------------------------------------------------------\\\

--  ---------------------------------------------------------------------------------------------\\\
--  ---[ Banner           ]----------------------------------------------------------------------///
local Banner = [[##  ===============================================================================================
#   TITLE :
#   ABOUT :
#   LINKS :
#   FILES :
#   TAGS  :
##  ===============================================================================================
]]
    vim.keymap.set("n", "<leader>0", function()
        vim.fn.setreg('"', Banner) -- Zet de tekst in het onbenoemde register
        vim.cmd('normal! ""p')                 -- Plak de inhoud van het onbenoemde register
    end, { noremap = true, silent = true, desc = "Mijn permanente recording tekst" })
--  ---------------------------------------------------------------------------------------------\\\

--  ---[ Colorcolumns     ]----------------------------------------------------------------------///
    _G.colorcolumn_state = _G.colorcolumn_state or 0
    local function toggle_colorcolumn()
    _G.colorcolumn_state = (_G.colorcolumn_state + 1) % 3 -- Cycle 0, 1, 2
    if _G.colorcolumn_state == 1 then
        vim.opt.colorcolumn = "4,31,50,80"
        print("ColorColumn: 4,31,50,80")
    elseif _G.colorcolumn_state == 2 then
        vim.opt.colorcolumn = "4,38,62,100"
        print("ColorColumn: 4,38,62,100")
    else
        vim.opt.colorcolumn = "" -- Schakelt colorcolumn uit
        print("ColorColumn: Uitgeschakeld")
    end
    end
    vim.keymap.set('n', '<leader>cc', toggle_colorcolumn, { desc = "Toggle ColorColumn" })
--  ---------------------------------------------------------------------------------------------\\\

    vim.keymap.set("c", "<CR>", function()
      return vim.fn.getcmdtype() == "/" and "<CR>zz" or "<CR>"
    end, { expr = true })

--  ---[ Comment-block : TODO ]------------------------------------------------------------------///
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
--  ---[ Comment-block : NOTE ]------------------------------------------------------------------///
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
--  ---[ Comment-block : WARN ]------------------------------------------------------------------///
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

--  ---[ Fold 1           ]----------------------------------------------------------------------///
local fold1 = [[
##  ---[                  ]----------------------------------------------------------------------///
[                  ]

##  ---------------------------------------------------------------------------------------------\\\

]]
vim.keymap.set("n", "<leader>1", function()
    vim.fn.setreg('"', fold1) -- Zet de tekst in het onbenoemde register
    vim.cmd('normal! ""p')                 -- Plak de inhoud van het onbenoemde register
end, { noremap = true, silent = true, desc = "Mijn permanente recording tekst" })
--  ---------------------------------------------------------------------------------------------\\\
--  --------------------------[ Fold2            ]-----------------------------------------------///
local fold2 = [[
##  --------------------------[                  ]-----------------------------------------------///
[                  ]

##  ---------------------------------------------------------------------------------------------\\\

]]
vim.keymap.set("n", "<leader>2", function()
    vim.fn.setreg('"', fold2)
    vim.cmd('normal! ""p')
end, { noremap = true, silent = true })
--  ---------------------------------------------------------------------------------------------\\\
--  -------------------------------------------------[ Fold3            ]------------------------///
local fold3 = [[
##  -------------------------------------------------[                  ]-----------------------///
[                  ]

##  --------------------------------------------------------------------------------------------\\\

]]
vim.keymap.set("n", "<leader>3", function()
    vim.fn.setreg('"', fold3)
    vim.cmd('normal! ""p')
end, { noremap = true, silent = true })
--  --------------------------------------------------------------------------------------------\\\


