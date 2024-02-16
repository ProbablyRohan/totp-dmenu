{
  description = "Flake for totp-dmenu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux = 

      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        pname = "totp-dmenu";
        version = "0.0.1";
        src = self;
        installPhase = ''
          mkdir -p $out/bin
          cp totp-dmenu $out/bin/totp-dmenu
        '';
#          wrapProgram $out/bin/totp-dmenu \
#          --prefix PATH : ${lib.makeBinPath [ bash ]}
#        '';
      };

  };
}
