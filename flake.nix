{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel.url = "github:jas-singhfsu/hyprpanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";
    walker.url = "github:abenz1267/walker";
    wpaperd.url = "github:danyspin97/wpaperd";
    stylix.url = "github:danth/stylix?rev=e00ed7e7f4b828f8b12c5056a6167890e59854ce";
  };

  outputs = { 
    self, 
    nixpkgs, 
    home-manager,
    hyprpanel,
    ... 
    } @ inputs: let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          inputs.hyprpanel.overlay
        ];
      };
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system; 
            inherit inputs;
            inherit pkgs;
          };
          modules = [
            ./nixos/configuration.nix

            inputs.stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.minowak = import ./modules/home.nix;
              home-manager.extraSpecialArgs = { inherit inputs; };
            }
          ];
        };
      };
    };
}
