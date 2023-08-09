import 'package:flutter_office_furniture_store_app/Controller/Increament_Decrement_Provider/Count.dart';
import 'package:flutter_office_furniture_store_app/Controller/Increament_Decrement_Provider/StateNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<CountNotifier, Count>((ref) {
  return CountNotifier(Count(count: 0));
});
