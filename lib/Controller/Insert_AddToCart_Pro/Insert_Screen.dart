// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
abstract class AddToCartStates {}

@immutable
class AddToCartLoadingState extends AddToCartStates {}

@immutable
class AddToCartLoadedState extends AddToCartStates {}
