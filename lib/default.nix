{ ... }:
{
  mkPackageOverlay =
    input: name:
    # Returning an overlay
    final: prev: {
      __dontExport = true;
      ${name} =
        input.packages.${prev.system}.${name} or input.defaultPackage.${prev.system}
          or input.packages.${prev.system}.default;
    };
}
