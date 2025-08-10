{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    idris2
    idris2Packages.pack
  ];

  shellHook = "";
}
