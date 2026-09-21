{ config, lib, ... }:

{
  # Sway as the compositor
  programs.sway = {
    enable = true;
    
    # Conditionally apply hide unsupported driver flag on nvidia systems
    extraOptions = 
      lib.optionals
        (lib.elem "nvidia" config.services.xserver.videoDrivers)
	[ "--unsupported-gpu" ];
  };  

  # UWSM as the standard desktop "manager"
  programs.uwsm.enable = true;
}
