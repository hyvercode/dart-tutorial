
# This is simple dart project cli

## How to compile 

### Windows
dart compile exe \
  --target-os=windows \
  --target-arch=x64 \
  cli_apps.dart \
  -o hello.exe

### Linux
dart compile exe \
  --target-os=linux \
  --target-arch=x64 \
  cli_apps.dart

### MacOS intel
  dart compile exe \
    --target-os=macos \
    --target-arch=x64 \
  cli_apps.dart

### MacOS Apple Silicon
dart compile exe \
  --target-os=macos \
  --target-arch=arm64 \
cli_apps.dart
  
### Linux arm64
dart compile exe \
  --target-os=linux \
  --target-arch=arm64 \
cli_apps.dart

### Android
dart compile exe \
  --target-os=android \
  --target-arch=arm64 \
cli_apps.dart

## How to run on linux

./cli_apps.exe 