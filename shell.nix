{ pkgs ? import <nixpkgs> {} }:
# { pkgs ? import (fetchTarball  "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11") {} }:
let
  message = "Lets Start Development";
in 
pkgs.mkShellNoCC {
  buildInputs = with pkgs; [ nodejs_21 ];

  packages = with pkgs; [
    nodejs_21
    nodePackages.browser-sync 
    nodePackages.nodemon 
    nodePackages.parcel
    vscodium 
    firefox-devedition 
    nodejs 
    pkgs.nodePackages.nodemon
    pkgs.nodePackages.browser-sync 
    pkgs.nodePackages.parcel
    vim 
    curl     
    cinnamon.nemo
  ];

  shellHook = ''
    cowsay ${message}
    npm run dev & echo "y" | codium & firefox localhost:3000 & npm run dev & firefox 127.0.0.1:5501
    '';
}
