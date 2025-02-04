// TODO: Put public facing types in this file.

import 'package:diverpro/abs/di_container.dart';

class DiverPro {

  /// Returns the singleton instance of [DiverPro].
  factory DiverPro() => _instance;

  /// A private constructor to prevent instantiation of [DiverPro].
  DiverPro._();

  /// The singleton instance of [DiverPro].
  static final DiverPro _instance = DiverPro._();


  // /// A private container to store the instances of dependencies.
  // final DiContainer _container = DiContainer();

  /// Registers an instance of type [T].
  /// [T] is the type of the instance, and [instance] is the instance itself.
  void register<T>(T instance) {
    DiContainer.register<T>(instance);
  }

  /// Registers a factory function that creates an instance of type [T].
  /// The factory is executed when [get<T>()] is called for the first time.
  void factory<T>(T Function() factory) {
    DiContainer.registerFactory<T>(factory);
  }

  /// Registers a singleton instance of type [T], meaning the same instance is used each time [get<T>()] is called.
  void singleton<T>(T Function() factory) {
    DiContainer.registerSingleton<T>(factory);
  }

  /// Registers a lazy singleton instance, which is created only when [get<T>()] is called.
  void lazySingleton<T>(T Function() factory) {
    DiContainer.registerLazySingleton<T>(factory);
  }

  /// Retrieves an instance of type [T]. If the instance is a factory function, it will invoke the factory.
  T? get<T>() => DiContainer.get<T>();

  /// Clears all registered instances.
  static void clear() {
    DiContainer.clear();
  }

}