{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    deno
    nodejs_22
    pnpm
    yarn-berry
  ];

  shellHook = ''
    export PATH=$PATH:$PWD/node_modules/.bin
  '';
}
