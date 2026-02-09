
--     _                 _       _
--    | |__   ___   ___ | |_ ___| |_ _ __ __ _ _ __  	   ___                          _
--    | '_ \ / _ \ / _ \| __/ __| __| '__/ _` | '_ \ 	  / / |__ _ ____  _ ___ _ ___ _(_)_ __
--    | |_) | (_) | (_) | |_\__ \ |_| | | (_| | |_) |	 / /| / _` |_ / || |___| ' \ V / | '  \
--    |_.__/ \___/ \___/ \__|___/\__|_|  \__,_| .__/ 	/_/ |_\__,_/__|\_, |   |_||_\_/|_|_|_|_|
--                                            |_|    	               |__/
--  ===============================================================================================

    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
                { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                { out, "WarningMsg" },
                { "\nPress any key to exit..." },
            }, true, {})
        vim.fn.getchar()
        os.exit(1)
        end
    end
    vim.opt.rtp:prepend(lazypath)

    require("config.options")
    require("config.globals")
    require("config.keymaps")
    require("config.autocmds")
    require("config.colors")

    require("lazy").setup({
        spec = {
            {import = "plugins" },
        },
        rtp = {
            disabled_plugins = {
                "netrw",
                "netrwPlugin"
            },
        },
        -- automatically check for plugin updates
        checker = { enabled = true },
    })

