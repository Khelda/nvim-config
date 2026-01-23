{
  description = "Dependency locks for my Neovim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ ];
        };

        luaEnv = pkgs.neovim-unwrapped.lua.withPackages (ps: with ps; [ magick ]);

        luaPath = pkgs.neovim-unwrapped.lua.pkgs.luaLib.genLuaPathAbsStr luaEnv;
        luaCPath = pkgs.neovim-unwrapped.lua.pkgs.luaLib.genLuaCPathAbsStr luaEnv;

        wrappedNeovim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
          neovimRcContent = ''
            set runtimepath^=${./.}
            source ${pkgs.vimPlugins.vim-plug}/plug.vim
            let g:inMyFlake = 1
            runtime! init.vim
          '';
          plugins = [ ];
          vimAlias = true;

          extraPython3Packages =
            ps:
            (with ps; [
              pynvim
              jupyter-client
            ]);

          wrapperArgs = [
            "--prefix"
            "LUA_PATH"
            ";"
            luaPath
            "--prefix"
            "LUA_CPATH"
            ";"
            luaCPath
          ];
        };

        bootstrap = pkgs.callPackage ./nixos/bootstrap.nix { };
        wrappedNeovimOffline = wrappedNeovim.override (prev: {
          wrapperArgs = prev.wrapperArgs ++ [
            "--prefix"
            "PATH"
            ":"
            "${bootstrap.packages}/bin"
          ];
          neovimRcContent = ''
            source ${bootstrap}/bootstrap.vim
            ${prev.neovimRcContent}
          '';
        });

        addProfiles =
          neovim:
          pkgs.symlinkJoin {
            inherit (neovim) name meta;
            paths = [ neovim ];
            postBuild = ''
              sed 's/" "$@"/;vim.g.startGoyo=1" "$@"/' ${neovim}/bin/nvim > $out/bin//goyo
              chmod +x $out/bin/goyo
            '';
          };
      in
      {
        legacyPackages = pkgs;
        packages.default = self.packages.${system}.neovim;
        packages."neovim" = addProfiles wrappedNeovim;
        packages."neovim-offline" = addProfiles wrappedNeovimOffline;
        packages."neovim-full" = addProfiles (
          wrappedNeovim.override (prev: {
            wrapperArgs = prev.wrapperArgs ++ [
              "--suffix"
              "PATH"
              ":"
              "${bootstrap.lspPackages}/bin"
              "--suffix"
              "PATH"
              ":"
              "${bootstrap.packages}/bin"
            ];
          })
        );
        packages."neovim-full-offline" = addProfiles (
          wrappedNeovimOffline.override (prev: {
            wrapperArgs = prev.wrapperArgs ++ [
              "--suffix"
              "PATH"
              ":"
              "${bootstrap.lspPackages}/bin"
            ];
          })
        );

        apps.nvim = {
          type = "app";
          program = "${self.packages.${system}.neovim}/bin/nvim";
        };
        apps.goyo = {
          type = "app";
          program = "${self.packages.${system}.neovim}/bin/goyo";
        };
      }
    );
}
