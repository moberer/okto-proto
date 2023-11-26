# Oktobat Prototype

A simple Godot + Rust prototype for Linux and Android.

## Dependencies

To build for Linux Desktop, you need the following dependencies

- godot 4
- rustup
- just
  
After that, you can run
```bash
just setup
```

## Building

To build the gdextension for the Linux Desktop, you can use

```bash
just all
```

or just

```bash
just
```

Note that the first compilation takes a lot longer than all following ones.
You can also use `just linux` if you don't want / need the Android binaries and want faster builds.

You can then open the project in the Godot Editor and it should "just work" (TM).


## Preparing to export for Android

1) Generate a Developer Key
(Change user / password as you see fit)
```bash
keytool -keyalg RSA -genkeypair -alias androiddebugkey -keypass android -keystore debug.keystore -storepass android -dname "CN=Android Debug,O=Android,C=US"
 -validity 9999 -deststoretype pkcs12
```
2) Set up Key in Godot
  - Top Bar -> Editor -> Editor Settings
  - Search for "Android" in the search bar
  - Click on Export->Android on the Sidebar
  - Set the "Debug Keystore" to the file you just created (debug.keystore)
  - Set username to "androiddebugkey" (or the one you used)
  - Set password to "android" (or the one you used)

3) Set up Android SDK in Godot
   - Stay in the same screen as above
   - Set the "Android SDK Path" to "/home/YOURUSERNAMEHERE/Android/Sdk"
   - Ensure you have a fitting SDK installed in Android Studio

4) Export the Android apk
   - This is the only step you'll have to repeat in the future.
   - Top Bar -> Project -> Export
   - Select Android in the left bar
   - Press the "Export Project" button in the bottom bar
   - Select where to put the apk
