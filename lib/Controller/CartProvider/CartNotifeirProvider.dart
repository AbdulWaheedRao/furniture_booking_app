import 'package:flutter_office_furniture_store_app/Controller/CartProvider/CartNotifier.dart';
import 'package:flutter_office_furniture_store_app/Controller/CartProvider/States.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartStates>((ref) {
  return CartNotifier();
});
