{ config, pkgs, lib, ... }:

with lib;

{
  options.myuser = {
    username = mkOption {
      type = types.str;
    };
    uid = mkOption {
      type = types.int;
    };
    realname = mkOption {
      type = types.str;
      default = "";
    };
    shell = mkOption {
      type = types.either types.shellPackage types.path;
      default = pkgs.zsh;
    };
    packages = mkOption {
      type = types.listOf types.package;
      default = with pkgs; [
      ];
    };
  };

  config = {
    users.users = (builtins.listToAttrs [{
      name = config.myuser.username;
      value = {
        isNormalUser = true;
        uid = config.myuser.uid;
        shell = config.myuser.shell;
        extraGroups = [
          "wheel"
          "audio"
          "video"
          "networkmanager"
          "input"
          "libvirtd"
	  "qemu-libvirtd"
          "vboxusers"
          "docker"
        ];
        packages = config.myuser.packages;
      };
    }]);
  };
}
