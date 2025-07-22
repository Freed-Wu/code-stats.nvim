package = "xml-temp"
version = "1.1.4-1"
local git_ref = '3eb208a4c9847659d0e7856781e821a62f9c6de6'
local repo_url = 'https://github.com/lubyk/xml'
source = {
  url = repo_url .. '/archive/' .. git_ref .. '.zip',
  dir = 'xml-' .. git_ref,
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
