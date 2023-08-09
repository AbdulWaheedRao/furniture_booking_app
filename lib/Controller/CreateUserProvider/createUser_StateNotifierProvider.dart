import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_office_furniture_store_app/Controller/CreateUserProvider/States.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final creatUserProvider = StateNotifierProvider<CreateUserNotifier, States>(
    (ref) => CreateUserNotifier());

class CreateUserNotifier extends StateNotifier<States> {
  CreateUserNotifier() : super(LoadedState());

  get loadingState => state = LoadingState();
  get loadedState => state = LoadedState();

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String userName,
      required String address}) async {
    final firebaseFirestore =
        FirebaseFirestore.instance.collection('creatUser');

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.toString(), password: password.toString())
          .then((value) async {
        await firebaseFirestore.doc(value.user!.uid).set({
          'userName': userName,
          'email': email,
          'password': password,
          'address': address
        });
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
