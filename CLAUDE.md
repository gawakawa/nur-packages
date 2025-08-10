# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a NUR (Nix User Repository) packages repository that provides a template structure for publishing personal Nix packages. It uses Nix flakes and includes CI/CD automation via GitHub Actions.

## Key Commands

### Building and Testing
- `nix-build -A <package-name>` - Build a specific package (e.g., `nix-build -A example-package`)
- `nix-env -f . -qa \*` - List all available packages
- `nix build .#<package-name>` - Build using flakes (e.g., `nix build .#example-package`)
- `nix-build ci.nix -A buildOutputs` - Build all buildable packages
- `nix-build ci.nix -A cacheOutputs` - Build all cacheable packages

### Package Evaluation
- `nix-env -f . -qa \* --meta --xml --option restrict-eval true` - Check package evaluation (used in CI)
- `nix flake check` - Validate the flake structure

## Architecture

### Core Structure
- `default.nix` - Main package set definition that exports packages, lib functions, modules, and overlays
- `flake.nix` - Nix flake configuration using nixpkgs-unstable
- `ci.nix` - CI logic that determines which packages are buildable and cacheable based on meta attributes

### Package Organization
- `pkgs/` - Individual package definitions (each in its own subdirectory with `default.nix`)
- `lib/` - Shared library functions
- `modules/` - NixOS modules
- `overlays/` - Nixpkgs overlays

### Package Requirements
- Mark broken packages with `meta.broken = true` to exclude from CI builds
- Use `meta.license` to specify licensing (unfree packages are filtered out in CI)
- Set `preferLocalBuild = true` for packages that shouldn't be cached

### CI/CD Integration
The repository uses GitHub Actions that:
1. Tests package evaluation across multiple nixpkgs channels (unstable, nixos-unstable, nixos-25.05)
2. Builds all packages using `nix-build-uncached` against `ci.nix`
3. Optionally caches builds in Cachix
4. Triggers NUR registry updates on successful builds

Configuration placeholders in `.github/workflows/build.yml` need to be updated:
- `<YOUR_REPO_NAME>` - Repository name in NUR registry
- `<YOUR_CACHIX_NAME>` - Cachix cache name (optional)