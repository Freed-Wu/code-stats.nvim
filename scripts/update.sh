#!/usr/bin/env bash
set -e
cd "$(dirname "$(dirname "$(readlink -f "$0")")")"

nix-shell --run 'luarocks install --lua-version 5.1 --local --force assets/rockspecs/xml-1.1.3-1.rockspec STDCPP_LIBDIR=$STDCPP_LIBDIR &&
luarocks install --lua-version 5.1 --local --force lua-requests OPENSSL_INCDIR=$OPENSSL_INCDIR OPENSSL_LIBDIR=$OPENSSL_LIBDIR'
luarocks install --lua-version 5.1 --local --force code-stats.nvim
