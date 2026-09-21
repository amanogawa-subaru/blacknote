{ username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";

  wayland.windowManager.sway = {
    enable = true;
    package = null;

    # UWSM owns graphical-session lifecycle.
    systemd.enable = false;

    extraConfig = ''
      exec uwsm finalize SWAYSOCK
    '';
  };

  programs.foot.enable = true;
  programs.wofi.enable = true;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
}
