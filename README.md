# blacknote

**a minimal NixOS profile using sway with gruvbox colors.**

This profile is intended to be installed and used with [bedrock](https://github.com/amanogawa-subaru/bedrock). 

To activate this profile, run from the TTY:
```bash
uwsm start sway.desktop
```

There are multiple wallpapers available in `home/dots/sway/wallpapers/`. Sway looks for a file called `current` (which is a symlink) in that directory and applies that as the wallpaper. This is done so that wallpaper changes do not necessitate editing the config file itself.

To change wallpapers, just change the current symlink with your desired wallpaper. For example:
```bash
# Move to wallpapers directory
cd ~/nixos-profiles/blacknote/home/dots/sway/wallpapers

# Change symlink
ln -sf <wallpaper-name> current
```
And apply the new wallpaper by reloading sway with `meta+Shift+R`

The `current` symlink is gitignored by default so that wallpaper changes are not tracked bygit. Therefore, after first install, you have to create the symlink first in order to have a wallpaper (or don't if you dont want one).
