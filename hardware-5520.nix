{ config, pkgs, ... }:

{
  # hardware.bluetooth.enable = true;

  hardware.bumblebee.enable = false;
  #hardware.bumblebee = {
  #  enable = true;
  #  connectDisplay = true;
  #};

  services.xserver.libinput = {
    enable = true;
    accelProfile = "adaptive";
    accelSpeed = "0.7";
    scrollMethod = "twofinger";
    tapping = false;
    tappingDragLock = false;
    naturalScrolling = true;
    disableWhileTyping = true;
    additionalOptions = ''
      Option "SendEventsMode" "disabled-on-external-mouse"
    '';
  };

  services.xserver.videoDrivers = [
  #  "nvidia"
    "intel"
  ];
}
