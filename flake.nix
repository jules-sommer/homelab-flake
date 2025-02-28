{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    unstable.url = "nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jimhome = {
      url = "git+https://git.nixfox.ca/Jimbo/nixos-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    unstable,
    impermanence,
    disko,
    home-manager,
    ...
  }@inputs:
  {
    nixosConfigurations.rubble = nixpkgs.lib.nixosSystem {
      modules = [ ./system ];
      specialArgs = inputs;
    };
  };
}
