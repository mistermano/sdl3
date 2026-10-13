# SDL 3 wrapper for Nim

Based on https://github.com/transmutrix/nim-sdl3 but heavily modified to use idiomatic Nim names.

# Installation

How to install the required SDL 3 binaries.

## Linux

### Ubuntu

```
sudo apt install libsdl3-0
sudo apt install libsdl3-dev
sudo apt install libsdl3-ttf-dev
sudo apt install libsdl3-image-dev
sudo apt install libsdl3-mixer-dev
```

### Arch

```
sudo pacman -S sdl3
sudo pacman -S sdl3_ttf
sudo pacman -S sdl3_image
sudo pacman -S sdl3_mixer
```

### Fedora

```
sudo dnf install SDL3-devel
sudo dnf install SDL3_ttf-devel
sudo dnf install SDL3_image-devel
```
SDL3_mixer is not packaged in Fedora yet, compile it manually if you want to use it.

## macOS

Via brew:

```
brew install sdl3
brew install sdl3_ttf
brew install sdl3_image
brew install sdl3_mixer
```

## Windows

With MSYS2

### MinGWx86_64
`pacman -Syu mingw-w64-x86_64-sdl3 mingw-w64-x86_64-sdl3-image mingw-w64-x86_64-sdl3-mixer mingw-w64-x86_64-sdl3-sound mingw-w64-x86_64-sdl3-ttf`

### UCRT
`pacman -Syu mingw-w64-ucrt-x86_64-sdl3 mingw-w64-ucrt-x86_64-sdl3-image mingw-w64-ucrt-x86_64-sdl3-mixer mingw-w64-ucrt-x86_64-sdl3-net mingw-w64-ucrt-x86_64-sdl3-sound  mingw-w64-ucrt-x86_64-sdl3-ttf`

### CLANG
`pacman -Syu mingw-w64-clang-x86_64-sdl3 mingw-w64-clang-x86_64-sdl3-image mingw-w64-clang-x86_64-sdl3-mixer mingw-w64-clang-x86_64-sdl3-net mingw-w64-clang-x86_64-sdl3-sound mingw-w64-clang-x86_64-sdl3-ttf`

### Nim's MinGW
If you installed MinGW through Nim's `finish.exe`, you will have to manually copy the `include` folder from SDL3, https://github.com/libsdl-org/SDL/tree/main/include/SDL3 , into its `include` folder.
Assuming your Nim is installed at the `C:\` root, the SDL3 will be copied into `C:\nim\dist\mingw64\include`, such that you can access `C:\nim\dist\mingw64\include\SDL3` and see the header files in there.

In order to run programs compiled for Windows, `SDL3.dll` must be within the same folder as the .exe.

## Other OSes

To be determined.

