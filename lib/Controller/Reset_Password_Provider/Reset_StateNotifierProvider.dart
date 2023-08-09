import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_office_furniture_store_app/Controller/CreateUserProvider/States.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resetPasswordProvider = StateNotifierProvider<CreateUserNotifier, States>(
    (ref) => CreateUserNotifier());

class CreateUserNotifier extends StateNotifier<States> {
  CreateUserNotifier() : super(LoadedState());

  get loadingState => state = LoadingState();
  get loadedState => state = LoadedState();

  Future<void> createPasswordResetEmail({
    required String email,
  }) async {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    try {} catch (e) {
      log(e.toString());
    }
  }
}
