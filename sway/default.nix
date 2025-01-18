 { pkgs, config, inputs, ... }: {
 wayland.windowManager.sway = {
    
    enable = true; 
    
    package = pkgs.swayfx; 
    
    checkConfig = false;
    
    xwayland = true;

    wrapperFeatures.gtk = true;
    
    extraConfig = ''
    include /etc/sway/config.d/*
    '';

    config = {
      terminal = "alacritty";
      menu = "wofi --show drun";
    };

  workspaceLayout = "default";
	defaultWorkspace = "workspace number 1";

    focus.followMouse = true;

	   bars = [ { command = "${pkgs.waybar}/bin/waybar"; } ];
	   gaps = {
	     inner = 7;
	     outer = 7;
	   };
    
    floating = {
	     border = 0;
	     titlebar = false;
	   };

	   window = {
	    border = 0;
	    titlebar = false;
	   };

	   input = {
	     "*" = {
	       xkb_layout = "us,ru";
	       xkb_options = "grp:alt_shift_toggle";
	   	};
	   };

	   modifier = "Mod4";

	   floating.modifier = "${config.wayland.windowManager.sway.config.modifier}";

	   bindkeysToCode = true;

	   keybindings = let
	    mod = config.wayland.windowManager.sway.config.modifier;
	   in {
	    "${mod}+1" = "workspace number 1";
	    "${mod}+2" = "workspace number 2";
	    "${mod}+3" = "workspace number 3";
	    "${mod}+4" = "workspace number 4";
	    "${mod}+5" = "workspace number 5";
	    "${mod}+6" = "workspace number 6";

	    "${mod}+Shift+1" = "move container to workspace number 1";
      "${mod}+Shift+2" = "move container to workspace number 2";
      "${mod}+Shift+3" = "move container to workspace number 3";
      "${mod}+Shift+4" = "move container to workspace number 4";
    "${mod}+Shift+5" = "move container to workspace number 5";
    "${mod}+Shift+6" = "move container to workspace number 6";

	"${mod}+q" = "kill";
	"${mod}+Return" = "exec ${config.wayland.windowManager.sway.config.terminal}";
    "Print" = "exec ${pkgs.lib.getExe takescreenshot}";

	    "${mod}+f" = "fullscreen";
      "${mod}+t" = "floating toggle";
	    "${mod}+Shift+r" = "reload";
      "${mod}+Shift+q" = "exec 'swaymsg exit'";
      "${mod}+w" = "exec ${config.wayland.windowManager.sway.config.menu}";
	      };
	   };
	   extraConfigEarly = ''
	   blur disable
	   corner_radius 13
	   shadows enable
	   shadow_blur_radius 10
	   shadow_color #2a283e
	   '';
	};
};
}