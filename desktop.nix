{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    # atom
    chromium
    elmPackages.elm
    feh
    firefox
    gimp
    i3lock-fancy
    inkscape
    # pmutils
    # steam
    # steam-run
    # vlc
  ];

  networking.firewall.enable = true;
  networking.firewall.trustedInterfaces = [
    "docker0"
    "vboxnet0"
  ];

  networking.networkmanager.enable = true;

  programs.bash.enableCompletion = true;

  programs.mtr.enable = true;

  programs.zsh.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.syntaxHighlighting.highlighters = [
    # "main"
    "brackets"
  ];
  programs.zsh.shellInit = ''
    unsetopt share_history
    bindkey -e
  '';

  security.chromiumSuidSandbox.enable = true;

  services.illum.enable = true;

  #services.mopidy = { # @TODO
  #  enable = true;
  #  extensionPackages = with pkgs; [
  #    mopidy-spotify
  #    mopidy-soundcloud
  #    mopidy-youtube
  #  ];
  #  # @TODO configuration
  #};

  services.ntp = {
    enable = true;
    servers = [
      "0.fi.pool.ntp.org" "1.fi.pool.ntp.org"
      "2.fi.pool.ntp.org" "3.fi.pool.ntp.org"
    ];
  };

  services.redshift = {
    enable = true;
    latitude = "62.14";
    longitude = "25.44";
  };

  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "colemak";
  services.xserver.xkbOptions = "eurosign:e,caps:backspace,nbsp:none";

  services.xserver.desktopManager.default = "gnome3";
  services.xserver.desktopManager.gnome3.enable = lib.mkDefault true;
  # services.xserver.desktopManager.xfce.enable = true;
  services.xserver.desktopManager.xterm.enable = false;

  services.xserver.displayManager.gdm.enable = true;

  services.xserver.windowManager.i3.enable = lib.mkDefault true;
  #services.xserver.windowManager.i3.extraPackages = with pkgs; [
  #  i3lock-fancy
  #];

#  services.xserver.desktopManager.gnome3.extraGSettingsOverrides = ''
#    [/org/gnome/desktop/peripherals/touchpad]
#    send-events='disabled'
#  '';

  sound.mediaKeys.enable = true;

  # Temporary fix for session list not showing in gdm
  # https://github.com/NixOS/nixpkgs/issues/34101
  system.activationScripts.etcX11sessions = ''
    echo "setting up /etc/X11/sessions..."
    mkdir -p /etc/X11
    [[ ! -L /etc/X11/sessions ]] || rm /etc/X11/sessions
    ln -sf ${config.services.xserver.displayManager.session.desktops} /etc/X11/sessions
  '';

  system.autoUpgrade.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
}
