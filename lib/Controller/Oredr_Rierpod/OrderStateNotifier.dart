import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_office_furniture_store_app/Controller/CartProvider/FetchCartItems.dart';
import 'package:flutter_office_furniture_store_app/Controller/Oredr_Rierpod/OrderStates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderStateNotifier extends StateNotifier<OrderStates> {
  OrderStateNotifier() : super(OrderLoadedState());

  orderSave({
    String? address,
    String? number,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('orderData').doc().set({
        'list': list2.map((e) => e.toMap()),
        'address': address,
        'number': number
      });

      state = OrderLoadedState();
    } catch (e) {
      log(e.toString());
    }
  }
}
