# build-llvm.nix
# Build from GitHub LLVM tag - llvmorg-21.1.0-rc3
{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "llvm-build-21.1.0-rc3";
  version = "git";

  nativeBuildInputs = with pkgs; [
    cmake
    ninja
    python3
  ];

  # Add runtime dependencies here
  buildInputs = with pkgs; [
    libxml2
    zlib
    ncurses
    libffi
  ];
  
  src = pkgs.fetchFromGitHub {
    owner = "llvm";
    repo = "llvm-project";
    rev = "llvmorg-21.1.0-rc3";
    sha256 = "sha256-quZuqDIm8OrkDJqu7vJKUP8MF1xCuQNFwW9SnKMFoS8=";
  };
  sourceRoot = "source/llvm";
  
  buildPhase = ''
    cmake -S llvm -B build -G Ninja \
    -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;lldb;compiler-rt" \
    -DLLVM-ENABLE_RUNTIMES="libcxx;libcxxabi"
    cmake --build build --prefix /usr/local
  '';
}
