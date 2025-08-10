{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    elan
  ];

  shellHook = "";
}
