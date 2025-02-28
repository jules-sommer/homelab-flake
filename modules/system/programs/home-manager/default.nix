{ unstable, ... }:
{
  home-manager = {
    useUserPackages = true;
    backupFileExtension = "bak";
    extraSpecialArgs = {
      inherit
        unstable
        ;
    };
  };
}
