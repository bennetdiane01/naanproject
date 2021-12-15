import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BeThePartnerController extends GetxController{

  // for all the text controller here
  TextEditingController txtNameController = TextEditingController();
  TextEditingController txtSurnameController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtPhoneController = TextEditingController();
  TextEditingController txtQuantityController = TextEditingController();
  TextEditingController txtBusinessController = TextEditingController();
  TextEditingController txtAmountController = TextEditingController();
  TextEditingController txtBuesinessAddressController = TextEditingController();
  TextEditingController txtCountryController = TextEditingController();
  TextEditingController txtStateController = TextEditingController();
  TextEditingController txtCityController = TextEditingController();
  TextEditingController txtZipController = TextEditingController();
  TextEditingController txtOtherController = TextEditingController();

  //declare variables
  var foodType;
  var businessType;
  var donate;


  //firebase variables
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;

  //for form key declaration
  final formKey1 = new GlobalKey<FormState>();

  // for loading
  bool uploading = false;


  //For page arguments
  final arguments = Get.arguments;





  createBeThePartner() async {
    var form = formKey1.currentState;

    if(
    txtNameController.text == "" ||
    txtSurnameController.text == "" ||
    txtEmailController.text == "" ||
    txtPhoneController.text == "" ||
    txtQuantityController.text == "" ||
    txtBusinessController.text == "" ||
    txtAmountController.text == "" ||
    txtBuesinessAddressController.text == "" ||
    txtCountryController.text == "" ||
    txtStateController.text == "" ||
    txtCityController.text == "" ||
    txtZipController.text == ""
    //txtOtherController.text == ""
    //donate == ""
    ){
      return Get.snackbar(
        'Error',
        'Please check all your field and try again!',
        backgroundColor: colorRed,
        colorText: colorWhite,
        snackPosition: SnackPosition.TOP,
        isDismissible: true,
      );
    }


    // validated form
    try{
      firestoreInstance.collection('beThePartner').add({
        'firstname': txtNameController.text,
        'surname': txtSurnameController.text,
        'email': txtEmailController.text,
        'telephone': txtPhoneController.text,
        'quantityAmount': txtQuantityController.text,
        'businessName': txtBusinessController.text,
        'averageAmount': txtAmountController.text,
        'foodType': foodType,
        'businessType': businessType,
        'donate': donate,
        'businessAddress': txtBuesinessAddressController.text,
        'country': txtCountryController.text,
        'state': txtStateController.text,
        'city': txtCityController.text,
        'zip': txtZipController.text,
        'other': txtOtherController.text,
        'creadtedBy': firebaseUser!.displayName,
        'userId': firebaseUser!.uid,
        'userImg': firebaseUser!.photoURL,
        'createdAt': DateTime.now(),
      }).whenComplete(() => uploading = false);
      Get.dialog(
          AlertDialog(
            actions: [
              ElevatedButton(
                onPressed: (){
                  txtNameController.clear();
                      txtSurnameController.clear();
                      txtEmailController.clear();
                      txtPhoneController.clear();
                      txtQuantityController.clear();
                      txtBusinessController.clear();
                      txtAmountController.clear();
                      txtBuesinessAddressController.clear();
                      txtCountryController.clear();
                      txtStateController.clear();
                      txtCityController.clear();
                      txtZipController.clear();
                      txtOtherController.clear();
                  Get.back();
                },
                child: Text('Ok'),
              )
            ],
            content: Container(
              height: 20.h,
              child: Center(
                child: Text('Campaign uploaded!'),
              ),
            ),
          )
      );
    } catch(e){
      print(e);
      Get.snackbar('Error', 'An error occured!');
    }
    update();
  }

}