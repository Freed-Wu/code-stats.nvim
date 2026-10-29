rockspec_format = '3.0'
description = {
  summary = '',
  detailed = '',
  labels = {},
  homepage = 'https://github.com/Freed-Wu/code-stats.nvim',
  license = 'GPL-3.0',
}
package = description.homepage:match('/([^/]+)/?$')
version = 'scm-1'
source = {
  url = description.homepage:gsub('https', 'git')
}

dependencies = { 'lua >= 5.1', 'lua-requests-temp', 'lua-dotenv', 'datafile' }
build = {
  type = 'builtin',
  install = {
    conf = {
      ['filetype.json'] = 'etc/conf/filetype.json',
    }
  }
}
