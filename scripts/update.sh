#!/usr/bin/env bash
set -e
cd "$(dirname "$(dirname "$(readlink -f "$0")")")"

eval "luarocks install --local --force assets/rockspecs/xml-1.1.3-1.rockspec STDCPP_LIBDIR=$(scripts/get-STDCPP_LIBDIR.nix)"
eval "luarocks install --local --force lua-requests OPENSSL_INCDIR=$(scripts/get-OPENSSL_INCDIR.nix) OPENSSL_LIBDIR=$(scripts/get-OPENSSL_LIBDIR.nix)"
