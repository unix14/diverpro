import 'package:diverpro/abs/di_container.dart';
import 'package:diverpro/src/diverpro_base.dart';
import 'package:test/test.dart';

class MyService {
  final String id;
  MyService(this.id);
}

void main() {
  group('DiContainer', () {
    setUp(() {
      // Clear the container before each test
      DiContainer.clear();
    });

    test('registerLazySingleton should create only one instance', () {
      // Register a lazy singleton with a factory that creates a MyService instance
      DiContainer.registerLazySingleton<MyService>(() => MyService('unique-id'));

      // Get the first instance
      final firstInstance = DiContainer.get<MyService>();
      // Get the second instance
      final secondInstance = DiContainer.get<MyService>();

      // Check if both instances are the same (same reference)
      expect(firstInstance, same(secondInstance));
      expect(firstInstance?.id, 'unique-id');
    });

    test('registerLazySingleton should not call the factory more than once', () {
      // Track how many times the factory is called
      var callCount = 0;

      // Register a lazy singleton with a factory
      DiContainer.registerLazySingleton<MyService>(() {
        callCount++;
        return MyService('unique-id');
      });

      // Get instances and ensure the factory is only called once
      DiContainer.get<MyService>();
      DiContainer.get<MyService>();

      // The factory should have been called only once
      expect(callCount, 1);
    });

    test('Lazy Singleton should return same instance', () {
      DiContainer.registerLazySingleton<MyService>(() => MyService('LazyService'));

      final instance1 = DiContainer.get<MyService>();
      final instance2 = DiContainer.get<MyService>();

      expect(instance1, same(instance2));
      expect(instance1?.id, 'LazyService');
    });

    test('Factory should return different instances', () {
      DiContainer.registerFactory<MyService>(() => MyService('FactoryService'));

      final instance1 = DiContainer.get<MyService>();
      final instance2 = DiContainer.get<MyService>();

      expect(instance1, isNot(same(instance2)));
      expect(instance1?.id, 'FactoryService');
      expect(instance2?.id, 'FactoryService');
    });

    test('Singleton should return same instance', () {
      DiContainer.registerSingleton<MyService>(() => MyService('SingletonService'));

      final instance1 = DiContainer.get<MyService>();
      final instance2 = DiContainer.get<MyService>();

      expect(instance1, same(instance2));
      expect(instance1?.id, 'SingletonService');
    });
  });

  group("DiverPro", () {
    late DiverPro diverPro;
    setUp(() {
      // Clear the container before each test
      DiContainer.clear();
      diverPro = DiverPro();
    });
    diverPro.register<MyService>(MyService('DiverProService'));

    test('DiverPro should return same instance', () {
      final instance1 = diverPro.get<MyService>();
      final instance2 = diverPro.get<MyService>();

      expect(instance1, same(instance2));
      expect(instance1?.id, 'DiverProService');
    });

    test('DiverPro should return different instance', () {
      diverPro.factory<MyService>(() => MyService('DiverProFactoryService'));

      final instance1 = diverPro.get<MyService>();
      final instance2 = diverPro.get<MyService>();

      expect(instance1, isNot(same(instance2)));
      expect(instance1?.id, 'DiverProFactoryService');
      expect(instance2?.id, 'DiverProFactoryService');
    });
  });
}