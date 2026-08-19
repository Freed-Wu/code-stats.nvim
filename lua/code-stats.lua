--- base class for CodeStats
local requests = require "requests"
local json = require "cjson"
local dotenv = require "lua-dotenv"

local M = {
    CodeStats = {
        xps = {},
        time = 0,
        interval = 10000,
        args = {
            timeout = 0.5,
            url = "https://codestats.net/",
            headers = {
                ['Content-Type'] = 'application/json',
                ['User-Agent'] = 'code-stats-nvim/0.1.0',
                Accept = '*/*'
            },
        },
        ---<https://gitlab.com/code-stats/code-stats-vim/-/blob/fb545a1814dc0d001e185c8f1dde564f2f0ea358/pythonx/codestats_filetypes.py>
        filetypes = json.decode(debug.getinfo(1).source:match("@?(.*)/") .. "filetype.json")
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
    args.data = json.encode({ xps = xps, coded_at = os.date("!%Y-%m-%dT%H:%M:%S") })
    return requests.get(args)
end

return M
