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

To build the gdextension (aka the Rust plugin) for all platforms, you can use *any one* of the following commands

```bash
just     # automatically executes just all
just a   # alias for all
just all
```

Note that the first compilation takes a lot longer than all following ones.
You can then open the project in the Godot Editor and it should "just work" (TM).

The following sections describe how to build / check certain things faster and are not necessary to try this demo out.

### Building just for ...

You can also use 
```bash
just linux
just android
``` 
if you just want to build the binaries for one of the platforms.
This (of course) makes the build faster.

### Just checking ...

If you are quickly iterating through the Rust code and just want it to be internally consistent. 
(Without producing a binary!)
You can run *any one* of the following commands:
```bash
just check
just c      # alias for check
```


## Preparing to Export for Android

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

4) Continue with "Export for Android"

## Export for Android
 - Top Bar -> Project -> Export
 - Select Android in the left bar
 - Press the "Export Project" button in the bottom bar
 - Select where to put the apk
