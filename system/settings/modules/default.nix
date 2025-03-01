{ modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/minimal.nix")
    (modulesPath + "/profiles/headless.nix")
  ];
}
