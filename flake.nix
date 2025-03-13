{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    unstable.url = "nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    neovim.url = "github:jules-sommer/nixvim_flake?ref=testing";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      unstable,
      impermanence,
      disko,
      ...
    }@inputs:
    {
      nixosConfigurations.progesterone = nixpkgs.lib.nixosSystem {
        modules = [
          ./system
          (
            { config, ... }:
            {
              environment.systemPackages = [
                inputs.neovim.packages.${config.nixpkgs.hostPlatform.system}.default
              ];
            }
          )
        ];
        specialArgs = inputs;
      };
    };
}
