local git_ref = 'scm'
local modrev = git_ref
local specrev = '1'

local repo_url = 'https://github.com/Freed-Wu/code-stats.nvim'

rockspec_format = '3.0'
package = 'code-stats.nvim'
version = modrev ..'-'.. specrev

description = {
  summary = 'Code::Stats plugin for Neovim',
  detailed = '',
  labels = { 'vim', 'lua', 'neovim', 'code-stats' },
  homepage = 'https://github.com/Freed-Wu/code-stats.nvim',
  license = 'GPL-3.0'
}

dependencies = { 'lua >= 5.1', 'lua-requests', 'lua-dotenv' }

test_dependencies = { }

source = {
  url = repo_url .. '/archive/' .. git_ref .. '.zip',
  dir = 'code-stats.nvim-' .. modrev,
}

if modrev == 'scm' or modrev == 'dev' then
  source = {
    url = repo_url:gsub('https', 'git')
  }
end

build = {
  type = 'builtin',
  copy_directories = { 'plugin', 'assets', 'scripts' } ,
  install = {
    conf = {
      ['..'] = 'shell.nix',
    },
  },
}
