import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomePageController  extends GetxController{
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  var campaignsFirestore;

  double value = 0.0;

  @override
  void onInit() {
    // TODO: implement onInit
    campaignsFirestore = firestoreInstance.collection("campaigns").snapshots();
    //viewCampaigns();
    super.onInit();
  }

  void updateSliderValue(double sliderValue) {
    value = sliderValue;
    update();
  }

  // for view all campaigns
  void viewCampaigns() {
    campaignsFirestore = firestoreInstance.collection("campaigns").snapshots();
    update();
  }
}