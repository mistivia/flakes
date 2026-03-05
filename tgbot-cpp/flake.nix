{
  description = "Nix flake for reo7sp/tgbot-cpp";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    tgbot-cpp-src = {
      url = "github:reo7sp/tgbot-cpp";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, tgbot-cpp-src }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages = {
          tgbot-cpp = pkgs.stdenv.mkDerivation {
            pname = "tgbot-cpp";
            version = "unstable";

            src = tgbot-cpp-src;

            nativeBuildInputs = with pkgs; [
              cmake
            ];

            buildInputs = with pkgs; [
              boost
              openssl
              zlib
              curl
            ];

            cmakeFlags = [
              "-DENABLE_TESTS=ON"
            ];

            doCheck = true;

            meta = with pkgs.lib; {
              description = "C++ library for Telegram Bot API";
              homepage = "https://github.com/reo7sp/tgbot-cpp";
              license = licenses.mit;
              platforms = platforms.unix;
            };
          };

          default = self.packages.${system}.tgbot-cpp;
        };
      });
}
