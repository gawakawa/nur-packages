{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    deno
    nodePackages.nodejs
    yarn-berry
  ];

  shellHook = ''
    export PATH=$PATH:$PWD/node_modules/.bin
  '';
}
