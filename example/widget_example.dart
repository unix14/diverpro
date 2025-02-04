import 'package:diverpro/mixin/state_manager_mixin.dart';
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> with StateManagerMixin {
  @override
  Widget build(BuildContext context) {
    // Dependency Injection
    diverPro.register<String>("instance");
    String? injectedString = diverPro.get<String>(); // returns "instance"


    // State Management
    listenToChanges('username');
    stateManager.set('username', 'JohnDoe');
    String? username = stateManager.get<String>('username') as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Widget with StateManager'),
      ),
      body: Center(
        child: Text('Hello, $username!'),
      ),
    );
  }
}
