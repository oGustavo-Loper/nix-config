{
  description = "NixOS Gustavo (inicio)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.notebook = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/notebook/configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.users.gustavo = import ./home/gustavo.nix;
        }
      ];
    };
  };
}