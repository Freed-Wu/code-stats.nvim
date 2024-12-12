{
  pkgs ? import <nixpkgs> { },
}:

with pkgs;
mkShell {
  name = "code-stats.nvim";
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
