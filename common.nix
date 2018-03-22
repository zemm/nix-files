{ config, pkgs, ... }:

{
  boot.cleanTmpDir = true;

  environment.shellAliases.homekeeper =
    "git --git-dir=\"\${HOME}/.homekeeper\" --work-tree=\"\${HOME}\"";

  #nixpkgs.overlays = [
  #  (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/overlay.nix")
  #];

  environment.extraInit = ''
    export EDITOR=nano
  '';

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    atop
    elinks
    gitFull
    gnumake
    gnupg
    htop
    imagemagick
    jq
    nano
    pass
    tmux
    unzip
    vim
    wget
    zip
    #home-manager
  ];

  fonts.enableFontDir = true;
  fonts.enableCoreFonts = true;
  fonts.enableGhostscriptFonts = true;
  fonts.fonts = with pkgs; [
    bakoma_ttf
    cantarell_fonts
    corefonts
    dejavu_fonts
    gentium
    inconsolata
    liberation_ttf
    powerline-fonts
    source-code-pro
    terminus_font
    ubuntu_font_family
  ];

  i18n.consoleFont = "Lat2-Terminus16";
  i18n.consoleKeyMap = "colemak/en-latin9";
  #i18n.defaultLocale = "fi_FI.UTF-8";
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;

  programs.ssh.agentTimeout = "12h";
  programs.ssh.startAgent = true;

  # @TODO
  #programs.gnupg.agent = {
  #  enable = true;
  #  enableSSHSupport = true;
  #};

  time.timeZone = "Europe/Helsinki";
}
