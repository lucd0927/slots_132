# spine-flutter

The spine-flutter runtime provides functionality to load, manipulate and render [Spine](https://esotericsoftware.com) skeletal animation data using [Flutter](https://flutter.dev/). spine-flutter is based on [spine-c](../spine-c) and supports desktop, mobile, and web Flutter deployment targets.

# See the [spine-flutter documentation](https://esotericsoftware.com/spine-flutter) for in-depth information.

## Licensing

You are welcome to evaluate the Spine Runtimes and the examples we provide in this repository free of charge.

You can integrate the Spine Runtimes into your software free of charge, but users of your software must have their own [Spine license](https://esotericsoftware.com/spine-purchase). Please make your users aware of this requirement! This option is often chosen by those making development tools, such as an SDK, game toolkit, or software library.

In order to distribute your software containing the Spine Runtimes to others that don't have a Spine license, you need a [Spine license](https://esotericsoftware.com/spine-purchase) at the time of integration. Then you can distribute your software containing the Spine Runtimes however you like, provided others don't modify it or use it to create new software. If others want to do that, they'll need their own Spine license.

For the official legal terms governing the Spine Runtimes, please read the [Spine Runtimes License Agreement](https://esotericsoftware.com/spine-runtimes-license) and Section 2 of the [Spine Editor License Agreement](https://esotericsoftware.com/spine-editor-license#s2).

## Spine version

spine-flutter works with data exported from Spine 4.3.xx.

spine-flutter supports all Spine features, except two-color tinting and the screen blend mode.

## Supported platforms
The spine-flutter runtime works on desktop, mobile and web.

## Setup
To add `spine_flutter` to your Flutter project, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  ...
  # See https://pub.dev/packages/spine_flutter for the latest version
  spine_flutter: ^4.3.0
```

In your `main()`, add this line in the beginning to initialize the Spine Flutter runtime:

```dart
void main() async {
    await initSpineFlutter(enableMemoryDebugging: false);
    ...
}
```

## Example
You can run the example like this:

1. install the [Flutter SDK](https://docs.flutter.dev/get-started/install), then run `flutter doctor` which will instruct you what other dependencies to install.
2. Clone this repository `git clone https://github.com/esotericsoftware/spine-runtimes`
3. Run `setup.sh` in the `spine-flutter/` folder. On Windows, you can use [Git Bash](https://gitforwindows.org/) included in Git for Window to run the `setup.sh` Bash script.

You can then open `spine-flutter` in an IDE or editor of your choice that supports Flutter, like [IntelliJ IDEA/Android Studio](https://docs.flutter.dev/get-started/editor?tab=androidstudio) or [Visual Studio Code](https://docs.flutter.dev/get-started/editor?tab=vscode) to inspect and run the example.

Alternatively, you can run the example from the [command line](https://docs.flutter.dev/get-started/test-drive?tab=terminal).

## Development
Run `./setup.sh` to copy over the spine-cpp and spine-c sources. This step needs to be executed every time spine-cpp or spine-c changes.

If all you modify are the Dart sources of the plugin, then the development setup is the same as the setup described under "Example" above.

If you need to update or modify the bindings generated from spine-c, run `./generate-bindings.sh`. If you regenerate the bindings, you must also compile the WASM binaries via `./compile-wasm.sh`.

Run `./publish.sh` to publish spine-flutter to pub.dev.

The `./tests` folder contains headless tests that exercise the bindings to [spine-c](../spine-c).
