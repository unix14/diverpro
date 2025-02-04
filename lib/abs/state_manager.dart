

import 'package:livedatax/livedatax.dart';

class StateManager {

  static final StateManager _instance = StateManager._internal();
  factory StateManager() => _instance;
  StateManager._internal();

  final Map<String, LiveData> _liveDataStates = {};

  void set<T>(String key, T value) {
    _liveDataStates[key] = LiveData(value);
  }

  LiveData<T>? get<T>(String key) {
    return _liveDataStates[key] as LiveData<T>?;
  }

  void remove(String key) {
    _liveDataStates.remove(key);
  }

  void clear() {
    _liveDataStates.clear();
  }
}