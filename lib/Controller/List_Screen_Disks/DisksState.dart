// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Model/Chair.dart';

@immutable
abstract class DisksStates {}

@immutable
class DisksLoadingState extends DisksStates {}

@immutable
class DisksLoadedState extends DisksStates {
  List<Chair> list;

  DisksLoadedState({
    required this.list,
  });
}

@immutable
class DisksErrorState extends DisksStates {}
