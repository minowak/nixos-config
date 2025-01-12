{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
  };

  outputs = { 
    self, 
    nixpkgs, 
    home-manager,
    hyprpanel,
    ... 
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
	specialArgs = {
	  inherit system; 
	  inherit inputs outputs; 
	};
        modules = [
          ./nixos/configuration.nix

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.minowak = import ./home-manager/home.nix;
          }
	  {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
        ];
      };
    };
  };
}
