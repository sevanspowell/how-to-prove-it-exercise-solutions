{ mkDerivation, base, containers, lhs2tex, stdenv }:
mkDerivation {
  pname = "how-to-prove-it";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [ base containers lhs2tex ];
  license = stdenv.lib.licenses.bsd3;
}
