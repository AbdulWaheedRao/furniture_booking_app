import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_office_furniture_store_app/Controller/List_Screen_Chairs/ChairState.dart';
import 'package:flutter_office_furniture_store_app/Controller/Utils/Utils.dart';
import 'package:flutter_office_furniture_store_app/Model/Chair.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChairsStateNotifier extends StateNotifier<ChairsStates> {
  ChairsStateNotifier() : super(ChairsLoadingState());

  fetchChair() async {
    try {
      var querry =
          await FirebaseFirestore.instance.collection('list_chair_data').get();
      final document = querry.docs;
      List<Chair> list = [];
      for (var x in document) {
        list.add(Chair.fromMap(x.data()));
      }
      state = ChairsLoadedState(list: list);
    } catch (e) {
      Utils().toastMessage(e.toString());
    }
  }
}
