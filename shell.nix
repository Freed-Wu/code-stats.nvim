{
  pkgs ? import <nixpkgs> { },
}:

with pkgs;
mkShell {
  name = "code-stats.nvim";
  env = {
    STDCPP_LIBDIR = "${stdenv.cc.cc.lib}/lib";
    OPENSSL_INCDIR = "${openssl.dev}/include";
    OPENSSL_LIBDIR = "${openssl.out}/lib";
  };
  buildInputs = [
    stdenv.cc
    openssl
    (luajit.withPackages (
      p: with p; [
        busted
        ldoc
      ]
    ))
  ];
}
