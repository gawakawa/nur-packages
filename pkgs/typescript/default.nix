{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    deno
    nodePackages.nodejs
    pnpm
    yarn-berry
  ];

  shellHook = ''
    export PATH=$PATH:$PWD/node_modules/.bin
  '';
}
