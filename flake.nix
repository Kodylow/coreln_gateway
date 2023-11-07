{
  description = "CLN Gateway Flake Starter Kit";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        # create shellHook aliases for the development shell
        mkShellHook = with pkgs; ''
          export PATH=${pkgs.lib.getBin pkgs.coreutils}/bin:$PWD/bin:$PATH
          alias cln-cli="lightning-cli --lightning-dir=${self}/.lightning --signet"
          alias gw-cli="gateway-cli --data-dir=${self}/.gateway --network=signet --password='thereisnosecondbest'"
        '';
      in
      {
        devShells = {
          default = pkgs.mkShell {
            nativeBuildInputs = [
              pkgs.clightning
              pkgs.just
              pkgs.mprocs
            ];
            shellHook = mkShellHook;
          };
        };
      }
    );
}
