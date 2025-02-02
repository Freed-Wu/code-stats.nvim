local git_ref = '$git_ref'
local modrev = '$modrev'
local specrev = '$specrev'

local repo_url = '$repo_url'

rockspec_format = '3.0'
package = '$package'
version = modrev ..'-'.. specrev

description = {
  summary = '$summary',
  detailed = $detailed_description,
  labels = $labels,
  homepage = '$homepage',
  $license
}

build_dependencies = { 'luarocks-build-embedded-rockspecs' }

dependencies = { 'lua >= 5.1', 'lua-requests', 'lua-dotenv' }

test_dependencies = $test_dependencies

source = {
  url = repo_url .. '/archive/' .. git_ref .. '.zip',
  dir = '$repo_name-' .. '$archive_dir_suffix',
}

if modrev == 'scm' or modrev == 'dev' then
  source = {
    url = repo_url:gsub('https', 'git')
  }
end

build = {
  type = "embedded-rockspecs",
  delegate_type = "builtin",
  copy_directories = $copy_directories,
  install = {
    conf = {
      ['..'] = 'shell.nix',
      ['../scripts/update.sh'] = 'scripts/update.sh',
      ['../scripts/get-OPENSSL_INCDIR.nix'] = 'scripts/get-OPENSSL_INCDIR.nix',
      ['../scripts/get-OPENSSL_LIBDIR.nix'] = 'scripts/get-OPENSSL_LIBDIR.nix',
      ['../scripts/get-STDCPP_LIBDIR.nix'] = 'scripts/get-STDCPP_LIBDIR.nix',
    },
  },
    rockspecs = {
[==[
package = "xml"
version = "1.1.3-1"
source = {
  url = 'git://github.com/lubyk/xml',
  dir = 'xml',
}
description = {
  summary = "Very fast xml parser based on RapidXML",
  detailed = [[
    This module is part of the Lubyk project.

    Main features are:
     - Fast and easy to use
     - Complete documentation
     - Based on proven code (RapidXML)
     - Full test coverage

    Read the documentation at http://doc.lubyk.org/xml.html.
  ]],
  homepage = "http://doc.lubyk.org/xml.html",
  license = "MIT"
}

dependencies = {
  "lua >= 5.1, < 5.4",
  "lub >= 1.0.3, < 2",
}
build = {
  type = 'builtin',
  modules = {
    -- Plain Lua files
    ['xml'            ] = 'xml/init.lua',
    ['xml.Parser'     ] = 'xml/Parser.lua',
    -- C module
    ['xml.core'       ] = {
      sources = {
        'src/Parser.cpp',
        'src/bind/dub/dub.cpp',
        'src/bind/xml_Parser.cpp',
        'src/bind/xml_core.cpp',
      },
      incdirs   = {'include', 'src/bind', 'src/vendor'},
    },
  },
  platforms = {
    freebsd = {
      modules = {
        ['xml.core'] = {
          sources = {
          },
          libraries = {'c++'},
        },
      },
    },
    linux = {
      modules = {
        ['xml.core'] = {
          sources = {
          },
          libraries = {'stdc++'},
        },
      },
    },
    macosx = {
      modules = {
        ['xml.core'] = {
          sources = {
          },
          libraries = {'stdc++'},
        },
      },
    },
  },
}
]==],
}
