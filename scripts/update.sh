#!/usr/bin/env bash
set -e
cd "$(dirname "$(dirname "$(readlink -f "$0")")")"

nix-shell --run 'luarocks install --lua-version 5.1 --local --force xml-temp STDCPP_LIBDIR=$STDCPP_LIBDIR &&
luarocks install --lua-version 5.1 --local --force luasec 0.7.2-1 OPENSSL_INCDIR=$OPENSSL_INCDIR OPENSSL_LIBDIR=$OPENSSL_LIBDIR'
