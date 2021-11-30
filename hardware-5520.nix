{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # hardware.bluetooth.enable = true;

  hardware.bumblebee.enable = false;
  #hardware.bumblebee = {
  #  enable = true;
  #  connectDisplay = true;
  #};

  services.acpid.enable = true;
  services.acpid.lidEventCommands = "systemctl suspend";
  services.acpid.powerEventCommands = "systemctl suspend";

  services.logind.extraConfig = ''
    HandlePowerKey=ignore
    HandleSuspendKey=ignore
    HandleHibernateKey=ignore
    HandleLidSwitch=ignore
  '';

  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad = {
    accelProfile = "adaptive";
    accelSpeed = "0.7";
    scrollMethod = "twofinger";
    tapping = false;
    tappingDragLock = false;
    clickMethodEnabled = "clickfinger";
    naturalScrolling = true;
    disableWhileTyping = true;
    # additionalOptions = ''
    #   Option "SendEventsMode" "disabled-on-external-mouse"
    # '';
  };

  # services.xserver.displayManager.gdm.wayland = false; # problems with nvidia?

  services.xserver.videoDrivers = [
  #  "nvidia"
    "intel"
  ];

  services.xserver.windowManager.i3.extraSessionCommands = ''
    xset r rate 250 32
  '';

  #swapDevices = [{
  #  device = "/var/swapfile";
  #  size = 8192;
  #}];
}
