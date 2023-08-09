import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_office_furniture_store_app/Controller/CartProvider/States.dart';
import 'package:flutter_office_furniture_store_app/Controller/Utils/Utils.dart';
import 'package:flutter_office_furniture_store_app/Model/AddToCartModelClass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<CartStates> {
  CartNotifier() : super(CartLoadingState());

  void fetchCart() async {
    try {
      var querry =
          await FirebaseFirestore.instance.collection('addToCartData').get();
      final document = querry.docs;
      List<ModelClassForAddToCart> list = [];
      for (var x in document) {
        list.add(ModelClassForAddToCart.fromMap(x.data()));
      }
      state = CartLoadedState(list: list);
    } catch (e) {
      Utils().toastMessage(e.toString());
    }
  }
}
