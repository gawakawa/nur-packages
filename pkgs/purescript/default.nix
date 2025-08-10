{ pkgs }:

let
  purescript-overlay = pkgs.fetchFromGitHub {
    owner = "thomashoneyman";
    repo = "purescript-overlay";
    rev = "main";
    sha256 = "1njsdyhlvsq3l9hwjppbvr4b0l9l7fid45f0f5anisc35jn9xaxa";
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
