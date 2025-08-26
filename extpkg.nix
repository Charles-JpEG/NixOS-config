# clang ( incomplete, not imported)
{
  environment.systemPackages = let
    prebuiltClang = pkgs.stdenv.mkDerivation rec {
      pname = "clang-prebuilt";
      version = "20.1.8";
      
      src = pkgs.fetchurl {
        url = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${version}/clang+llvm-${version}-armv7a-linux-gnueabihf.tar.gz";
        sha256 = "sha256-0000000000000000000000000000000000000000000="; # Update this
      };
      
      nativeBuildInputs = [ pkgs.autoPatchelfHook ];
      
      buildInputs = with pkgs; [
        stdenv.cc.cc.lib  # libgcc
        glibc
        libxml2
        zlib
        ncurses
      ];
      
      sourceRoot = ".";
      
      installPhase = ''
        mkdir -p $out
        cp -r * $out/
        
        # Make binaries executable
        chmod +x $out/bin/*
        
        # Create standard symlinks
        ln -sf $out/bin/clang $out/bin/cc
        ln -sf $out/bin/clang++ $out/bin/c++
      '';
      
      meta = with pkgs.lib; {
        description = "Pre-built Clang/LLVM toolchain";
        platforms = [ "armv7l-linux" ];
      };
    };
  in [
    prebuiltClang
  ];
}
