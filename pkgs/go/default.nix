{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    golines
    goperf
    gopls
    gotools
  ];

  shellHook = "";
}
