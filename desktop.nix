{ config, pkgs, ... }:

{
  networking.firewall.enable = true;
  networking.firewall.trustedInterfaces = [
    "docker0"
    "vboxnet0"
  ];

  networking.networkmanager.enable = true;

  programs.bash.enableCompletion = true;

  # @TODO
  #programs.gnupg.agent = {
  #  enable = true;
  #  enableSSHSupport = true;
  #};

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

  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "colemak";
  services.xserver.xkbOptions = "eurosign:e,caps:backspace,nbsp:none";

  services.xserver.desktopManager.default = "gnome3";
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable = true;

  system.autoUpgrade.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
}
