vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local KoduIsGreat_Fugitive = vim.api.nvim_create_augroup("KoduIsGreat_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = KoduIsGreat_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)
        
        vim.keymap.set("n", "<leader>ga", function()
            vim.cmd.Git('add .')
        end, opts)

        vim.keymap.set("n", "<leader>gc", function()
            vim.cmd.Git('commit')
        end, opts)

        vim.keymap.set("n", "<leader>gs", function()
            vim.cmd.Git('status')
        end, opts)
        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull',  '--rebase'})
        end, opts)
        
        vim.keymap.set("n", "<leader>gl", function()
            vim.cmd.Git('log')
        end, opts)
        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})
