# Personal System Configuration

This is the Repository for my personal system configuration. I'm currently only using a single system which I manage though [nix]().

## Overview

The basic system configuration is managed by [nix-darwin](), and per user configuration are managed by [home-manager]().

## Nix Darwin

Nix Darwin is a based on the nix package repository and tries to provide a similar experions like NixOS for macOS.

In my setup Nix Darwin manages:

- [sketchybar]()
- [yabai]()
- [skhd]()
- [homebrew]()

## Home Manager

I split `home-manager` from `nix-darwin` because I disliked the need of `sudo` privileges for user changes. This allows multiple user configuration independent of the global system configuration.
