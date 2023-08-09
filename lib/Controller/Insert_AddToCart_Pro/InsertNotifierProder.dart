import 'dart:developer';

import 'package:flutter_office_furniture_store_app/Controller/Insert_AddToCart_Pro/Insert_Notifier.dart';
import 'package:flutter_office_furniture_store_app/Controller/Insert_AddToCart_Pro/Insert_Screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final addToCartStateProvider =
    StateNotifierProvider<AddToCartStateNotifier, AddToCartStates>((ref) {
  return AddToCartStateNotifier();
});
