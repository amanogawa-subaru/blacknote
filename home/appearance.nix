# Blacknote appearance and theming

{ config, lib, pkgs, ... }:

let
  rgb = r: g: b: {
    inherit r g b;
  };

  firefoxColorTheme = {
    title = "Blacknote Gruvbox Dark";

    colors = {
      # Browser frame / toolbar
      frame = rgb 40 40 40;                    # #282828
      frame_inactive = rgb 40 40 40;
      toolbar = rgb 40 40 40;
      toolbar_text = rgb 235 219 178;          # #ebdbb2

      # Tabs
      tab_background_text = rgb 189 174 147;   # #bdae93
      tab_selected = rgb 60 56 54;             # #3c3836
      tab_text = rgb 235 219 178;
      tab_line = rgb 254 128 25;               # #fe8019
      tab_loading = rgb 254 128 25;
      tab_background_separator = rgb 80 73 69; # #504945

      # Address/search field
      toolbar_field = rgb 60 56 54;
      toolbar_field_text = rgb 235 219 178;
      toolbar_field_border = rgb 80 73 69;
      toolbar_field_border_focus = rgb 254 128 25;
      toolbar_field_focus = rgb 60 56 54;
      toolbar_field_highlight = rgb 254 128 25;
      toolbar_field_highlight_text = rgb 40 40 40;
      toolbar_field_separator = rgb 80 73 69;

      # Popups / menus
      popup = rgb 40 40 40;
      popup_text = rgb 235 219 178;
      popup_border = rgb 80 73 69;
      popup_highlight = rgb 80 73 69;
      popup_highlight_text = rgb 251 241 199;  # #fbf1c7

      # Icons / separators
      icons = rgb 235 219 178;
      icons_attention = rgb 254 128 25;
      button_background_active = rgb 80 73 69;
      toolbar_bottom_separator = rgb 80 73 69;
      toolbar_vertical_separator = rgb 80 73 69;

      # Sidebar
      sidebar = rgb 40 40 40;
      sidebar_text = rgb 235 219 178;
      sidebar_border = rgb 80 73 69;
      sidebar_highlight = rgb 254 128 25;
      sidebar_highlight_text = rgb 40 40 40;

      # New tab page
      ntp_background = rgb 40 40 40;
      ntp_text = rgb 235 219 178;
    };

    images = {
      additional_backgrounds = [ ];
      custom_backgrounds = [ ];
    };
  };

  firefoxColorStorage = pkgs.writeText
    "blacknote-firefox-color.json"
    (builtins.toJSON {
      firstRunDone = true;
      theme = firefoxColorTheme;
    });
in
{
  # Applications whose appearance Blacknote handles manually
  stylix.targets = {
    firefox.enable = false;
    librewolf.enable = false;
    sway.enable = false;
    waybar.enable = false;
    wofi.enable = false;
  };

  # Firefox Color
  programs.firefox.profiles.default
    .extensions.settings."FirefoxColor@mozilla.com" = {
      force = true;

      settings = {
        firstRunDone = true;
        theme = firefoxColorTheme;
      };
    };

  programs.librewolf.profiles.default
    .extensions.settings."FirefoxColor@mozilla.com" = {
      force = true;

      settings = {
        firstRunDone = true;
        theme = firefoxColorTheme;
      };
    };
  
  # Librewolf doesn't take firefox colors if storage.js is a symlink to nix store
  # this replaces storage.js with a regular file
  home.activation.librewolfFirefoxColor = 
    lib.hm.dag.entryAfter [ "linkGeneration" ] ''
      target="$HOME/.librewolf/default/browser-extension-data/FirefoxColor@mozilla.com/storage.js"

      mkdir -p "$(dirname "$target")"
      rm -f "$target"
      cp ${firefoxColorStorage} "$target"
    '';
  
  gtk.iconTheme = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
  };
}
