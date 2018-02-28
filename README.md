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
    ... others based on the role ...
  ];

  # Optional boot-stuff

  networking.hostName = ...

  # Optional or private services/programs

  users.users.... = ...

  system.stateVersion = ...
}
```
