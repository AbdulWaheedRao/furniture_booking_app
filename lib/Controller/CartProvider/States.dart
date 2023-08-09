// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Model/AddToCartModelClass.dart';

@immutable
abstract class CartStates {}

@immutable
class CartLoadingState extends CartStates {}

@immutable
class CartLoadedState extends CartStates {
  List<ModelClassForAddToCart> list;

  CartLoadedState({
    required this.list,
  });
}

@immutable
class CartErrorState extends CartStates {}
