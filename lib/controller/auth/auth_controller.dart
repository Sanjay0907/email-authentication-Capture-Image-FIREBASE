// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resolute_ai_assignment/constants.dart';
import 'package:resolute_ai_assignment/view/homepage.dart';
import '../../view/auth/signin.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => Login());
    } else {
      Get.offAll(() => const HomePage());
    }
  }

  registerUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // return true;
      }
      // else {
      //   Get.snackbar('Field Empty', 'Please fill all the fields.',
      //       overlayColor: Colors.amber);
      //   // return false;
      // }
    } catch (e) {
      Get.snackbar('Error SignUp', 'Opps! Failed to SignUp');
      // return false;
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        Get.snackbar(
          'Logg in Successful',
          '',
        );
      } else {
        Get.snackbar('Error Logging in', 'Please Enter all the Fields');
      }
    } catch (e) {
      Get.snackbar('Oops!', 'Invalid Credentials');
    }
  }
}
