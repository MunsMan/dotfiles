# Personal System Configuration

This is the Repository for my personal system configuration. I'm currently only using a single system which I manage though [nix](https://nixos.org/).

## Overview

The basic system configuration is managed by [nix-darwin](https://daiderd.com/nix-darwin/), and per user configuration are managed by [home-manager](https://github.com/nix-community/home-manager).

## Nix Darwin

Nix Darwin is a based on the nix package repository and tries to provide a similar experience like NixOS for macOS.

In my setup Nix Darwin manages:

- [sketchybar](https://felixkratz.github.io/SketchyBar/)
- [yabai](https://github.com/koekeishiya/yabai)
- [skhd](https://github.com/koekeishiya/skhd)
- [homebrew](https://brew.sh/)

### Global Fonts

To install fonts, including the pure font files doesn't work.
Instead, the font needs to be installed and then linked from `nix-darwin` into the system font directory.
To do so, the following steps are necessary:

1. enable font management

```nix
{
    fonts.fontDir.enable = true;
}
```

2. Install the font

```nix
{
    fonts.fonts = with pkgs; [ <font> ];
}
```

## Home Manager

I split `home-manager` from `nix-darwin` because I disliked the need of `sudo` privileges for user changes. This allows multiple user configuration independent of the global system configuration.
