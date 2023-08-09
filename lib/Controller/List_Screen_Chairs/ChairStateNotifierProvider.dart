import 'package:flutter_office_furniture_store_app/Controller/List_Screen_Chairs/ChairState.dart';
import 'package:flutter_office_furniture_store_app/Controller/List_Screen_Chairs/ChairStateNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chairProvider =
    StateNotifierProvider.autoDispose<ChairsStateNotifier, ChairsStates>((ref) {
  return ChairsStateNotifier();
});
