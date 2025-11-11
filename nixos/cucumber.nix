{
  dream2nix,
  config,
  lib,
  system,
  ...
}:

let
  cucumberLSPVersion = "v1.7.0";

  # TODO find a way to integrate tree-sitter-cli
in
{
  imports = [
    dream2nix.modules.dream2nix.mkDerivation
    # node-specific tools
    dream2nix.modules.dream2nix.nodejs-package-lock-v3
    dream2nix.modules.dream2nix.nodejs-granular-v3
  ];

  name = "cucumber-language-server";
  version = cucumberLSPVersion;

  mkDerivation = {
    src = builtins.fetchGit {
      shallow = true;
      url = "https://github.com/cucumber/language-server";
      ref = cucumberLSPVersion;
      rev = "c68c2033d91e72b0b15965e2f1f417e9f9b5917a";
    };
  };

  deps =
    { nixpkgs, ... }:
    {
      inherit (nixpkgs) fetchFromGitHub stdenv;
    };

  nodejs-package-lock-v3 = {
    packageLockFile = "${config.mkDerivation.src}/package-lock.json";
  };
}
