import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:naan_project/UI/donate/donate_page.dart';
import 'package:naan_project/UI/home/home_page.dart';
import 'package:naan_project/UI/profile/profile_page.dart';

class HomeMenuController extends GetxController{
  int selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> widgetOptions = <Widget>[
    HomePage(),
    DonatePage(),
    Text('3'),
    ProfilePage()
  ];

  @override
  void onInit() {

  }

  onItemTapped(int index) {
    selectedIndex = index;
    print(index);
    update();
  }
}