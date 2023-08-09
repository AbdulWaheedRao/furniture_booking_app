import 'package:flutter_office_furniture_store_app/Controller/List_Screen_Disks/DisksState.dart';
import 'package:flutter_office_furniture_store_app/Controller/List_Screen_Disks/DisksStateNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final diskProvider =
    StateNotifierProvider.autoDispose<DisksStateNotifier, DisksStates>((ref) {
  return DisksStateNotifier();
});
