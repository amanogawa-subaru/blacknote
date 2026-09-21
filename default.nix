{ username, pkgs, ... }:

{
  imports = [
    ./modules/desktop.nix
    ./modules/packages.nix
  ];

  # Home Manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit username;
    };

    users.${username}.imports = [
      ./home
    ];
  };

  # Stylix sets gruvbox theme
  stylix = {
    enable = true;

    base16Scheme = 
      "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    targets.regreet.enable = false;
  };
}
