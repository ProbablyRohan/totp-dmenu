{
  description = "Flake for totp-dmenu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    totp-cli.url = "github:probablyrohan/totp-cli";
  };

  outputs = { self, nixpkgs, totp-cli }: {

    defaultPackage.x86_64-linux = 

      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        pname = "totp-dmenu";
        version = "0.0.1";
        src = self;
        buildInputs = with pkgs; [ totp-cli.defaultPackage.x86_64-linux pkgs.bemenu ];
        installPhase = ''
          mkdir -p $out/bin
          cp totp-dmenu $out/bin/totp-dmenu
        '';
      };

  };
}
