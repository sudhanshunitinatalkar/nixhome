{
  description = "cosmos";

  inputs = 
  {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = 
    {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  {
    homeConfigurations."sudha" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-linux;
      modules = [ 
        ./home/home.nix 
        ({ pkgs, ... }: {
          nixpkgs.config.allowUnfree = true;
          home.username = "sudha";
          home.homeDirectory = "/home/sudha";
          home.stateVersion = "25.11";
        })
        ];
    };
  };
}
