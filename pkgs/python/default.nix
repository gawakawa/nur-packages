{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python312
    uv
  ];

  shellHook = "";
}
