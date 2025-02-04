
import 'package:diverpro/abs/state_manager.dart';
import 'package:diverpro/src/diverpro_base.dart';
import 'package:flutter/material.dart';
import 'package:livedatax/livedatax.dart';

mixin StateManagerMixin<T extends StatefulWidget> on State<T> {

  final DiverPro _diverPro = DiverPro();
  DiverPro get diverPro => _diverPro;

  final StateManager _stateManager = StateManager();
  StateManager get stateManager => _stateManager;

  //todo on init state
  // @override
  // void initState() {
  //   _listenToChanges();
  //   super.initState();
  // }

  void listenToChanges<T>(String key) {
    LiveData<T>? liveData = stateManager.get<T>(key);

    liveData?.observe((value) {
      update();
    });
  }

  void update() {
    setState(() {});
  }
}