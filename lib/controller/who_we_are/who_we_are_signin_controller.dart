import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhoWeAreSignController extends GetxController{
  List myActivities = [];
  String myActivitiesResult  = '';
  final formKey = new GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    myActivities;
    myActivitiesResult;
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      myActivitiesResult = myActivities.toString();
    }
  }
}