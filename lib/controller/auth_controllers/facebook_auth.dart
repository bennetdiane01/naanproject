import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:naan_project/UI/home/home_menu.dart';

class FacebookAuthController extends GetxController{
  var firebaseUser =  FirebaseAuth.instance.currentUser;

  Future<UserCredential?> signInWithFacebook() async {
    try{
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile', 'user_birthday']
      );
      if(result.status == LoginStatus.success){
        // Create a credential from the access token
        final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
        // Once signed in, return the UserCredential
        FirebaseFirestore.instance.collection('users').doc(firebaseUser!.uid).set({
          'displayName': firebaseUser!.displayName ?? '',
          'email' : firebaseUser!.email ?? '',
          'profileImg': firebaseUser!.photoURL ?? '',
          'phone': firebaseUser!.phoneNumber ?? '',
          'role': 'user',
          'provider': 'facebook',
          'uid': firebaseUser!.uid,
        });
        await FirebaseAuth.instance.signInWithCredential(credential);
        update();
        return Get.offAll(() => HomeMenu());
      }
      return null;
    } catch (e){
      print('error');
    }
    update();
  }
}