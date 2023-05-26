# ILP shell.nix

with import <nixpkgs> {};
let
  erlang = pkgs.beam_nox.interpreters.erlangR25;
  otpPackages = pkgs.beam.packagesWith erlang;
  elixir = otpPackages.elixir_1_14;
in
pkgs.mkShell {
  buildInputs = [
    elixir
    nodejs-18_x
    exa
    bat
  ];
}
