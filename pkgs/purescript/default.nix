{ pkgs }:

let
  purescript-overlay = pkgs.fetchFromGitHub {
    owner = "thomashoneyman";
    repo = "purescript-overlay";
    rev = "main";
    hash = "sha256-qquerCyD6WhVccAV0qI7NFGwSN7rXslhogPrTaFvWto=";
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
