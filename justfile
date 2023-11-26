alias a := all

[macos]
all: linux android ios

[linux]
all: linux android # can't build ios app on linux

# This needs to be set for cargo-ndk to work
# TODO: Add a way to customize this per installation
export ANDROID_NDK_HOME := "/opt/android-ndk"


rustdir := "cd rust;"

alias c := check
check:
    {{rustdir}} cargo check
    {{rustdir}} cargo clippy


linux:
    {{rustdir}} cargo build
    {{rustdir}} cargo build --release

android:
    {{rustdir}} cargo ndk -t arm64-v8a build
    {{rustdir}} cargo ndk -t arm64-v8a build --release

[macos]
ios:
    # NOTE: can only work on MacOS with xcode
    # untested
    {{rustdir}} cargo +aarch64-apple-ios build --release

setup:
    @ echo "Please ensure you need to have 'rustup' installed."
    @ echo "We will now install all Rust build dependencies, is this ok?."
    @ echo
    @ read -p "Press ENTER to continue, Ctrl-C to abort!"    rustup toolchain install stable
    rustup default stable
    rustup target add aarch64-apple-ios aarch64-linux-android
    rustup component add rustfmt clippy
    cargo install cargo-ndk cargo-lipo
