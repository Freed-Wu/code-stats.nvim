---neovim support for code stats.
---@diagnostic disable: undefined-global
-- luacheck: ignore 112 113
local CodeStats = require 'code-stats'.CodeStats

local M = {
    CodeStats = {}
}

---@param codestats table?
---@return table codestats
function M.CodeStats:new(codestats)
    codestats = codestats or {}
    codestats = CodeStats(codestats)
    setmetatable(codestats, {
        __index = self
    })
    return codestats
end

setmetatable(M.CodeStats, {
    __index = CodeStats,
    __call = M.CodeStats.new
})

---create autocmds.
---@param augroup_id integer?
function M.CodeStats:create_autocmds(augroup_id)
    augroup_id = augroup_id or vim.api.nvim_create_augroup("codestats", {})

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
                self:add_xp(vim.o.filetype, vim.b.xp)
                vim.b.xp = 0
            end
        end,
    })
    vim.api.nvim_create_autocmd("VimLeavePre", {
        group = augroup_id,
        callback = function()
            self:send_xp()
        end
    })
end

return M
