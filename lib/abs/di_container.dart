/// A container for registering and retrieving dependencies.
class DiContainer {

  // /// A factory constructor to return the singleton instance of [DiContainer].
  // factory DiContainer() => _instance;
  //
  // /// A private constructor to prevent instantiation of [DiContainer].
  // DiContainer._();
  //
  // /// The singleton instance of [DiContainer].
  // static final DiContainer _instance = DiContainer._();

  /// A private map to store the instances of dependencies.
  static final Map<Type, dynamic> _instances = {};

  /// Registers an instance of type [T].
  /// [T] is the type of the instance, and [instance] is the instance itself.
  static void register<T>(T instance) {
    _instances[T] = instance;
  }

  /// Registers a factory function that creates an instance of type [T].
  /// The factory is executed when [get<T>()] is called for the first time.
  static void registerFactory<T>(T Function() factory) {
    _instances[T] = factory;
  }

  /// Registers a singleton instance of type [T], meaning the same instance is used each time [get<T>()] is called.
  static void registerSingleton<T>(T Function() factory) {
    _instances.putIfAbsent(T, () => factory());
  }

  /// Registers a lazy singleton instance, which is created only when [get<T>()] is called.
  static void registerLazySingleton<T>(T Function() factory) {
    _instances.putIfAbsent(T, factory);
  }

  /// Retrieves an instance of type [T]. If the instance is a factory function, it will invoke the factory.
  static T? get<T>() {
    var instance = _instances[T];
    if (instance is Function) {
      return instance() as T;
    }
    return instance as T?;
  }

  /// Clears all registered instances.
  static void clear() {
    _instances.clear();
  }
}