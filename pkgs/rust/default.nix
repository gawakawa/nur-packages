{ pkgs, fetchFromGitHub }:

let
  rust-overlay = pkgs.fetchFromGitHub {
    owner = "oxalica";
    repo = "rust-overlay";
    rev = "master";
    hash = "sha256-5SEz135CaJ0LfHILi+CzWMXQmcvD2QeIf4FKwXAxtxA=";
  };
  pkgsWithOverlay = import pkgs.path {
    inherit (pkgs) system;
    overlays = [ (import rust-overlay) ];
  };
in
pkgsWithOverlay.mkShell {
  packages = with pkgsWithOverlay; [
    rust-bin.stable.latest.default
    rust-analyzer
  ];
}
