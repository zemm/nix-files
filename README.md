# My personal NixOS configs

## Current setup plan

Subject to change when I learn more.

Clone this into `/etx/nixos/nix-files`.

Setup local `/etc/nixos/configuration.nix` so that it:

- Imports applicaple shared things from the repo
- Contains private things that should not be in public repository
- Contains one-off installation specific things that are not meaningful as shared


## Example configuration.nix

```nix

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nix-files/hardware-....nix
    ./nix-files/common.nix
    # Optional based on the role of the machine
    ./nix-files/desktop.nix
    ./nix-files/user.nix
  ];

  # boot... = ...               # Installation specific

  # networking.hostName = ...

  # programs... = ...           # Optional machine specific one-offs

  # services.openssh.enabled = true;
  # services... = ...

  # Can vary on different machines
  myuser.username = "zemm";
  myuser.uid = 100;
  myuser.shell = "/run/current-system/sw/bin/zsh";

  # system.stateVersion = ...
}
```
