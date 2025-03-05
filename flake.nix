{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    unstable.url = "nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    unstable,
    impermanence,
    disko,
    ...
  }@inputs:
  {
    nixosConfigurations.rubble = nixpkgs.lib.nixosSystem {
      modules = [ ./system ];
      specialArgs = inputs;
    };
  };
}
