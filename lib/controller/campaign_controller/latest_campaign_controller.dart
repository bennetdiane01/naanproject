import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LatestCampaignController extends GetxController{
  var firebaseCampaign;
  var firebaseUser =  FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    // TODO: implement onInit
    firebaseCampaign = FirebaseFirestore.instance.collection('campaigns').snapshots();
    super.onInit();
  }
}