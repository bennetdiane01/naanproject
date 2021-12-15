import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naan_project/UI/home/home_menu.dart';

class EmailController extends GetxController{
  TextEditingController emailPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // SIgn up
  Future<String?> signUp() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: emailPhoneController.text, password: passwordController.text);
      Get.offAll(() => HomeMenu());
      update();
      return "Signed up";
    } on FirebaseAuthException catch(e) {
      update();
      return e.message;
    }
  }

  Future<String?> signIn() async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: emailPhoneController.text, password: passwordController.text);
      Get.offAll(() => HomeMenu());
      update();
      return "Signed in";
    } on FirebaseAuthException catch(e) {
      update();
      return e.message;
    }
  }
}