{ username, ... }:

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
}
