import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PaymentController extends GetxController{
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  void onApplePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

}