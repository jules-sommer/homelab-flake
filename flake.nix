{
  description = "A nix flake for Jules' homelab server";

  inputs = {
    master.url = "github:nixos/nixpkgs/master";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:numtide/nixpkgs-unfree?ref=nixos-unstable";
    # unfree.url = "github:numtide/nixpkgs-unfree";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "unstable";
    };

    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
    nixvim-flake.url = "github:jules-sommer/nixvim_flake";
  };

  outputs =
    {
      self,
      unstable,
      home-manager,
      utils,
      ...
    }@inputs:
    let
      inherit (utils.lib)
        mkFlake
        mkApp
        ;

      lib = unstable.lib.extend (_: _: (import ./lib { }) // home-manager.lib // utils.lib);
    in
    mkFlake {
      inherit self inputs;

      sharedOverlays = [
        (lib.mkPackageOverlay inputs.nixvim-flake "neovim")
      ];

      hosts = {
        progesterone = {
          system = "aarch64-linux";
          modules = [
            ./hosts/progesterone
          ];
        };
      };

      outputsBuilder =
        channels:
        {
        };

    };
}
