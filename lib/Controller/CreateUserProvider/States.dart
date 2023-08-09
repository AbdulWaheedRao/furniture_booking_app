import 'package:flutter/material.dart';

abstract class States {}

@immutable
class LoadingState extends States {}

@immutable
class LoadedState extends States {}
