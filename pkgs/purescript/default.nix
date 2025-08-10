{ pkgs }:

let
  purescript-overlay = builtins.fetchTarball {
    url = "https://github.com/thomashoneyman/purescript-overlay/archive/main.tar.gz";
  };
  pkgsWithOverlay = import pkgs.path {
    inherit (pkgs) system;
    overlays = [ (import "${purescript-overlay}/overlay.nix") ];
  };
in
pkgsWithOverlay.mkShell {
  name = "purescript-dev-shell";
  buildInputs = with pkgsWithOverlay; [
    purs
    spago-unstable
    purs-tidy
    purs-backend-es
    purescript-language-server
    nodejs_22
    esbuild
  ];

  shellHook = "";
}
