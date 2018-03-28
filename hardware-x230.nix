{ config, lib, pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    extraConfig = ''
      [general]
      Enable=Source,Sink,Media,Socket
    '';
  };

  hardware.cpu.intel.updateMicrocode = true;

  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
  ];

  hardware.trackpoint = {
    enable = true;
    emulateWheel = true;
    speed = 250;
    sensitivity = 140;
  };

  # https://github.com/NixOS/nixos-hardware/blob/5a00ea423a39b66dff032a03973932ab4f18af91/common/pc/laptop/default.nix
  powerManagement.cpuFreqGovernor =
    lib.mkIf config.services.tlp.enable (lib.mkForce null);

  services.tlp.enable = true; # TLP Linux Advanced Power Management

  services.xserver.libinput.enable = true;

  services.xserver.videoDrivers = [
    "intel"
  ];

  services.xserver.windowManager.i3.extraSessionCommands = ''
    xset r rate 250 32
  '';
}
