{
  description = "blacknote NixOS config";

  inputs = {
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    stylix.url = "github:nix-community/stylix";
  };

  outputs = { home-manager, stylix, ... }: {
    nixosModules.default = {
      imports = [
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
        ./default.nix
      ];
    };
  };
}
