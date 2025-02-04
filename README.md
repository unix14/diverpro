# DiverPro

DiverPro is a State Management Library and Dependency Injection package for Flutter. It's my take on Riverpod and Provider.

## Features

- State management
- Dependency injection
- Singleton, factory, and lazy singleton support

## Getting started

To use this package, add `diverpro` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  diverpro:
    git:
      url: https://github.com/unix14/diverpro.git
      ref: main
```

## Usage

### Registering Instances

You can register instances, factories, singletons, and lazy singletons using the DiverPro class.


```dart
import 'package:diverpro/diverpro.dart';

void main() {
final diverPro = DiverPro();

    // Register an instance
    diverPro.register<MyClass>(MyClass());
    
    // Register a factory
    diverPro.factory<MyClass>(() => MyClass());
    
    // Register a singleton
    diverPro.singleton<MyClass>(() => MyClass());
    
    // Register a lazy singleton
    diverPro.lazySingleton<MyClass>(() => MyClass());
    }
```

### Retrieving Instances

You can retrieve instances using the get method.

```dart
final myClassInstance = diverPro.get<MyClass>();
```

### Clearing Instances

You can clear all registered instances using the clear method.

```dart
DiverPro.clear();
```

### Additional information

Contributions are welcome! Please file issues and submit pull requests on the GitHub repository.
