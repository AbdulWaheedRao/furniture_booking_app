// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_office_furniture_store_app/Model/Chair.dart';

@immutable
abstract class ChairsStates {}

@immutable
class ChairsLoadingState extends ChairsStates {}

@immutable
class ChairsLoadedState extends ChairsStates {
  final List<Chair> list;

  ChairsLoadedState({
    required this.list,
  });
}

@immutable
class ErrorState extends ChairsStates {}
