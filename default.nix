{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:
let
  inherit (nixpkgs) pkgs;

  haskellPackages = if compiler == "default"
         then pkgs.haskellPackages
         else pkgs.haskell.packages.${compiler};
in
  {
    how-to-prove-it = haskellPackages.callPackage ./how-to-prove-it.nix {};
  }
