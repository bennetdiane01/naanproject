import 'package:get/get.dart';
import 'package:flutter/material.dart';
 class onboardingController extends GetxController {
   int currentPage = 0;

   PageController? _pageController;

   PageController? get pageController => _pageController;

   @override
  void onInit() {
    // TODO: implement onInit
     _pageController = PageController( initialPage: 0);
     super.onInit();
     update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _pageController!.dispose();
    super.onClose();
    update();

  }
 }