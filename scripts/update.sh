#!/usr/bin/env bash
set -e
cd "$(dirname "$(dirname "$(readlink -f "$0")")")"

nix-shell --run 'luarocks install --lua-version 5.1 --local --force code-stats.nvim STDCPP_LIBDIR=$STDCPP_LIBDIR OPENSSL_INCDIR=$OPENSSL_INCDIR OPENSSL_LIBDIR=$OPENSSL_LIBDIR'
