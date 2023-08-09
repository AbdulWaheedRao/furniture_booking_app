import 'package:flutter_office_furniture_store_app/Controller/Increament_Decrement_Provider/Count.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountNotifier extends StateNotifier<Count> {
  CountNotifier(super._state);
  void increament() {
    state = Count(count: state.count + 1);
  }

  void decreament() {
    state = Count(count: state.count - 1);
  }
}
