{ mkDerivation, base, containers, stdenv }:
mkDerivation {
  pname = "how-to-prove-it";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [ base containers ];
  license = stdenv.lib.licenses.bsd3;
}
