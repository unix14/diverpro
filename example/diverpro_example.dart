import 'dart:math';

import 'package:diverpro/abs/di_container.dart';

void main() {

  // DiContainer.register<Example>(DiverproExample());
  // DiContainer.registerFactory<Example>(() => DiverproExample());
  // DiContainer.registerSingleton<Example>(() => DiverproExample());
  DiContainer.registerLazySingleton<Example>(() => DiverproExample());

  (DiContainer.get<Example>())?.run();
  Future.delayed(Duration(seconds: 1), () =>
    (DiContainer.get<Example>())?.run()
  );


}


abstract class Example {
  void run();
}

class DiverproExample implements Example {

  late final int randIndex = Random().nextInt(30);

  @override
  void run() {
    print('awesome $randIndex');
  }
}