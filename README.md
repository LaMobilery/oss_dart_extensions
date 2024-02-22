# lamob_dart_extension

## Description

`lamob_dart_extension` is an open-source project aimed at providing Dart developers with a comprehensive list of independent packages that offer extensions for various Dart classes. 

These extensions are designed to enhance the functionality and usability of the Dart programming language, making it easier for developers to implement common tasks, improve code readability, and increase development efficiency. 

By leveraging these extensions, developers can write more concise and expressive code, tapping into a rich ecosystem of reusable components.

## Installation



## Contribute

To contribute to `lamob_dart_extension` into your project using Melos, follow these steps:

1. Ensure you have Melos installed. If not, you can install it by running:

```bash
dart pub global activate melos
```

2. Fork the project in your workspace and clone the fork on your machine
3. In the project, bootstrap it

```bash
melos bs
```

> See more on [melos website](https://melos.invertase.dev/getting-started)

4. Each independent package is provided in packages

### Create a package

In packages run

```bash
dart create -t package extensions_<CLASSNAME>
```

For example:
* dart create -t package extensions_string
* dart create -t package extensions_widget
* dart create -t package extensions_iterable
* ...

> More in [dart package](https://dart.dev/guides/libraries/create-packages)

In the newly created package, in the *pubspec.yaml*, update the 