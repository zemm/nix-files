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

  services.xserver = {
    enable = true;
    desktopManager.default = "gnome3";
    desktopManager.xterm.enable = false;
    desktopManager.gnome3.enable = true;
    displayManager.lightdm.enable = true;
    windowManager.i3.enable = true;
  };

  system.autoUpgrade.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
}
