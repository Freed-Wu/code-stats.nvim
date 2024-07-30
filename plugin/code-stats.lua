-- luacheck: ignore 112 113
---@diagnostic disable: undefined-global
local codestats = require "code-stats"
local augroup_id = vim.api.nvim_create_augroup("codestats", {})
vim.api.nvim_create_autocmd({ "InsertCharPre" }, {
    group = augroup_id,
    callback = function()
        vim.b.xp = (vim.b.xp or 0) + 1
    end,
})
vim.api.nvim_create_autocmd({ "BufWrite", "BufLeave" }, {
    group = augroup_id,
    callback = function()
        if vim.b.xp then
            codestats.add_xp(vim.o.filetype, vim.b.xp)
            vim.b.xp = 0
        end
    end,
})
vim.api.nvim_create_autocmd("VimLeavePre", {
    group = augroup_id,
    callback = codestats.send_xp
})
