{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:
(import ./default.nix { inherit nixpkgs compiler; }).how-to-prove-it.env
