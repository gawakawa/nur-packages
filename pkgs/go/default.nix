{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    golines
    gopls
  ];

  shellHook = "";
}
