import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:naan_project/UI/home/home_menu.dart';

class GoogleSignController extends GetxController{
  final googleSignin = GoogleSignIn();

  GoogleSignInAccount? user;
  var firebaseUser =  FirebaseAuth.instance.currentUser;


  Future googleLogin() async {
    try{
      final googleUser = await googleSignin.signIn();
      if(googleUser == null) return;
      user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      FirebaseFirestore.instance.collection('users').doc(firebaseUser!.uid).set({
        'displayName': firebaseUser!.displayName ?? '',
        'email' : firebaseUser!.email ?? '',
        'profileImg': firebaseUser!.photoURL ?? '',
        'phone': firebaseUser!.phoneNumber ?? '',
        'role': 'user',
        'provider': 'google',
        'uid': firebaseUser!.uid,
      });
      update();
      return Get.offAll(() => HomeMenu());
    } catch (e){
      print(e);
    }
  }
}