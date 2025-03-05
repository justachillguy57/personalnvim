# flake.nix

{
  description = "Lua dev shell";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.x86_64-linux.default =
        pkgs.mkShell
          {
            nativeBuildInputs = with pkgs; [
              lua-language-server
              luajit 
              stylua
            ];
            shellHook = '' 
                echo "language = <Lua>; (dev shell)"
                echo "pkgs_installed = [lua-ls, luajit, stylua];"
            '';
          };
    };
}

