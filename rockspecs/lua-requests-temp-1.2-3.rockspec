package = "lua-requests-temp"
version = "1.2-3"
local git_ref = '1.2-1'
local repo_url = 'https://github.com/JakobGreen/lua-requests'
source = {
  url = repo_url .. '/archive/' .. git_ref .. '.zip',
  dir = 'lua-requests-' .. git_ref,
}
description = {
  summary = "HTTP requests made easy! Support for HTTPS, Basic Auth, Digest Auth. HTTP response parsing has never been easier!",
  detailed = [[Similar to Requests for python.
    The goal of lua-requests is to make HTTP simple and easy to use.
    Currently HTTPS, Basic Authentication, and Digest Authentication are supported.
    Checkout the wiki on the github page for more details. Written in pure lua!
  ]],
  homepage = "http://github.com/JakobGreen/lua-requests",
  license = "MIT"
}
dependencies = {
  "lua >= 5.1",
  "luasocket",
  "md5",
  "lua-cjson",
  "xml-temp",
  "luasec >= 0.5.1, < 0.8-1"
}
build = {
  type = "builtin",
  modules = {
    requests = "src/requests.lua"
  }
}
