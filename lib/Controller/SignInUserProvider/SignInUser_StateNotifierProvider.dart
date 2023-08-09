import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_office_furniture_store_app/Controller/CreateUserProvider/States.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInUserProvider = StateNotifierProvider<CreateUserNotifier, States>(
    (ref) => CreateUserNotifier());

class CreateUserNotifier extends StateNotifier<States> {
  CreateUserNotifier() : super(LoadedState());

  get loadingState => state = LoadingState();
  get loadedState => state = LoadedState();

  Future<void> signInUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final firebaseFirestore =
        FirebaseFirestore.instance.collection('creatUser');

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.toString(), password: password.toString())
          .then((value) async {
        await firebaseFirestore.doc(value.user!.uid).set({
          'email': email,
          'password': password,
        });
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
