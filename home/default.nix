{ config, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";

  # ACTIVE DEVELOPMENT! REMOVE OUT OF STORE SYMLINK ONCE FINISHED!
  # Dotfiles
  xdg.configFile = {
    # Sway configs
    "sway/config".source = 
      config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nixos-profiles/blacknote/home/dots/sway/config";
    
    # Waybar configs
    "waybar/config.jsonc".source = 
      config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nixos-profiles/blacknote/home/dots/waybar/config.jsonc";

    "waybar/style.css".source = 
      config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/nixos-profiles/blacknote/home/dots/waybar/style.css";

  };

   # Applications 
  programs.foot.enable = true;
  programs.wofi.enable = true;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  # themes that will be handled separately
  stylix.targets = {
    firefox.enable = false;
    librewolf.enable = false;
    sway.enable = false;
    waybar.enable = false;
  };
}
