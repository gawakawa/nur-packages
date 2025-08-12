{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    golines
    gopls
    gotools
  ];

  shellHook = "";
}
