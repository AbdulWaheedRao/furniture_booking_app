import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_office_furniture_store_app/Controller/Insert_AddToCart_Pro/Insert_Screen.dart';
import 'package:flutter_office_furniture_store_app/Model/AddToCartModelClass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddToCartStateNotifier extends StateNotifier<AddToCartStates> {
  AddToCartStateNotifier() : super(AddToCartLoadedState());

  Future<void> addToCart({
    String? heading,
    String? id,
    String? image,
    int? quantity,
    double? price,
    String? description,
  }) async {
//
    ModelClassForAddToCart modelClassForAddToCart = ModelClassForAddToCart(
        price: double.parse(price.toString()),
        heading: heading!,
        description: description!,
        id: id!,
        image: image!,
        quantity: quantity!);
    try {
      await FirebaseFirestore.instance
          .collection('addToCartData')
          .doc()
          .set(modelClassForAddToCart.toMap());
      state = AddToCartLoadedState();
    } catch (e) {
      // log(e.toString());
    }
  }
}
