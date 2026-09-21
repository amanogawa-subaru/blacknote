{ config, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";

  # DEVELOPMENT! REMOVE OUT OF STORE SYMLINK ONCE FINISHED!
  # dotfiles
  xdg.configFile."sway/config".source = 
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nixos-profiles/blacknote/home/dots/sway/config";

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
  };
}
