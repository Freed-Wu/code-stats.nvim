--- base class for CodeStats
local requests = require "requests"
local cjson = require "cjson"
local dotenv = require "lua-dotenv"

local M = {
    CodeStats = {
        xps = {},
        time = 0,
        interval = 10000,
        args = {
            url = "https://codestats.net/",
            headers = {
                ['Content-Type'] = 'application/json',
                ['User-Agent'] = 'code-stats-nvim/0.0.1',
                ['X-API-Token'] = "",
                Accept = '*/*'
            },
        },
        filetypes = require 'code-stats.filetype'
    }
}

---@param codestats table?
---@return table codestats
function M.CodeStats:new(codestats)
    codestats = codestats or {}
    if codestats.dotenv then
        dotenv.load_dotenv(codestats.dotenv)
        codestats.args = codestats.args or M.CodeStats.args
        codestats.args.headers = codestats.args.headers or M.CodeStats.args.headers
        codestats.args.headers['X-API-Token'] = dotenv.get('CODESTATS_API_KEY')
    end
    codestats.args.headers['X-API-Token'] = codestats.args.headers['X-API-Token'] or
        M.CodeStats.args.headers['X-API-Token']
    setmetatable(codestats, {
        __index = self
    })
    return codestats
end

setmetatable(M.CodeStats, {
    __call = M.CodeStats.new
})

---add xp
---@param filetype string
---@param xp integer
function M.CodeStats:add_xp(filetype, xp)
    local language_type = self.filetypes[filetype] or filetype
    self.xps[language_type] = (self.xps[language_type] or 0) + xp
end

---send xp
---@return table
function M.CodeStats:send_xp()
    local xp = 0
    for _, v in pairs(self.xps) do
        xp = xp + v
    end
    if xp == 0 then
        return {}
    end
    local xps = self.xps
    self.xps = {}
    local args = self.args
    args.data = cjson.encode({ xps = xps, coded_at = os.date("!%Y-%m-%dT%H:%M:%S") })
    return requests.get(args)
end

return M
