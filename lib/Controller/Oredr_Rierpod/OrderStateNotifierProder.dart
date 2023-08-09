import 'package:flutter_office_furniture_store_app/Controller/Oredr_Rierpod/OrderStateNotifier.dart';
import 'package:flutter_office_furniture_store_app/Controller/Oredr_Rierpod/OrderStates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderStateProvider =
    StateNotifierProvider<OrderStateNotifier, OrderStates>((ref) {
  return OrderStateNotifier();
});
