{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    atom
    autorandr
    blueman
    chromium
    #docker_compose
    evtest
    feh
    firefox
    fwupd
    ghostscript
    gimp
    gnome3.gnome-bluetooth
    gparted
    i3lock-color
    i3lock-fancy
    i3lock-pixeled
    inkscape
    iotop
    libevdev
    libreoffice
    lm_sensors
    openldap
    openssl
    pavucontrol
    polybar
    # pmutils
    qemu_kvm
    scrot
    shutter
    udftools
    usbutils
    vagrant
    virtmanager
    vlc
    volumeicon
    vscode
    xautolock
    xclip
    xorg.xev
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  #hardware.bluetooth.extraConfig = "
  #  [General]
  #  Enable=Source,Sink,Media,Socket
  #";
  hardware.bluetooth.settings.General = {
    Enable = "Source,Sink,Media,Socket";
  };
  services.blueman.enable = true;

  hardware.pulseaudio = {
    enable = true;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    package = pkgs.pulseaudioFull;
  };

  networking.firewall.enable = true;
  networking.firewall.trustedInterfaces = [
    "docker0"
    #"vboxnet1"
    "virbr0"
    "virbr1"
    "virbr2"
    "virbr3"
  ];

  networking.networkmanager.enable = true;

  programs.bash.enableCompletion = true;
  programs.gnupg.agent.enable = true;
  programs.mtr.enable = true;

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

  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;

  services.gnome.gnome-keyring.enable = true;

  services.redshift = {
    enable = true;
  };
  location.latitude = 62.14;
  location.longitude = 25.44;

  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "colemak";
  services.xserver.xkbOptions = "eurosign:e,caps:backspace,nbsp:none";
  services.xserver.autoRepeatDelay = 230;
  services.xserver.autoRepeatInterval = 32;

  #services.xserver.desktopManager.default = "none";
  services.xserver.desktopManager.gnome.enable = lib.mkDefault true;
  services.xserver.desktopManager.xterm.enable = false;

  services.xserver.displayManager.gdm.enable = true;

  #services.xserver.windowManager.default = lib.mkDefault "i3";
  services.xserver.windowManager.i3.enable = lib.mkDefault true;
  #services.xserver.windowManager.i3.extraPackages = with pkgs; [
  #  i3lock-fancy
  #];

  services.xserver.displayManager.defaultSession = "none+i3";

#  services.xserver.inputClassSections = [
#    ''
#      Identifier "Trackball Wheel Emulation"
#      MatchProduct "Kensington      Kensington Expert Mouse"
#      #MatchDevicePath "/dev/input/event1"
#      #MatchProduct "Kensington Expert Mouse"
#
#      #Option "EmulateWheel" "true"
#      #Option "EmulateWheelButton" "8"
#
#      # https://gist.github.com/DamienCassou/e1e6b3746789276b7b25
#      # Make it work for both vertical and horizontal scroll
#      #Option "XAxisMapping" "6 7"
#      #Option "YAxisMapping" "4 5"
#      # Remap the buttons a little bit, since firefox will use
#      # button 8 as back button and that's not what I want
#      #Option "ButtonMapping" "1 8 3 4 5 6 7 10 9 2 11 12"
#
#      Driver "evdev"
#
#      # https://fransdejonge.com/2016/05/xorg-conf-emulatewheel-stopped-working-on-libinput-update/
#      Option "SendCoreEvents" "True"
#      #Option "ButtonMapping" "0 1 2 4 5 6 7 3"
#      Option "ScrollMethod" "button"
#      Option "ScrollButton "8"
#    ''
#  ];

  services.xserver.displayManager.sessionCommands = ''
    export TERMINAL=gnome-terminal
    xset r rate 220 40
  '';

#  services.xserver.desktopManager.gnome3.extraGSettingsOverrides = ''
#    [/org/gnome/desktop/peripherals/touchpad]
#    send-events='disabled'
#  '';

  sound.mediaKeys.enable = true;

  # Temporary fix for session list not showing in gdm
  # https://github.com/NixOS/nixpkgs/issues/34101
#  system.activationScripts.etcX11sessions = ''
#    echo "setting up /etc/X11/sessions..."
#    mkdir -p /etc/X11
#    [[ ! -L /etc/X11/sessions ]] || rm /etc/X11/sessions
#    ln -sf ${config.services.xserver.displayManager.session.desktops} /etc/X11/sessions
#  '';

  system.autoUpgrade.enable = true;

  virtualisation.docker.enable = false;
  #virtualisation.docker.storageDriver = "overlay";

  virtualisation.podman.enable = true;
  virtualisation.podman.dockerCompat = true;

  #virtualisation.virtualbox.host.enable = true;

  virtualisation.libvirtd.enable = true;
}
