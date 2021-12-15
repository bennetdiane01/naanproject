import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:naan_project/UI/auth/login_with.dart';
import 'package:naan_project/controller/home/home_menu_controller.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class HomeMenu extends StatelessWidget {
  HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeMenuController homeMenuController = Get.put(HomeMenuController());
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CupertinoActivityIndicator());
        } else if (snapshot.hasData){
          return Scaffold(
            backgroundColor: whiteColor,
            body: GetBuilder<HomeMenuController>(
                builder: (controller) {
                  return Center(
                    child: HomeMenuController.widgetOptions.elementAt(controller.selectedIndex),
                  );
                }
            ),
            bottomNavigationBar: GetBuilder<HomeMenuController>(
                builder: (controller) {
                  return BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(MaterialCommunityIcons.home_outline, color: colorBlack,),
                        label: '',
                        activeIcon: Container(
                            child: Icon(MaterialCommunityIcons.home_outline,  color: colorBlack,),
                            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5),
                            margin: EdgeInsets.only(top: 1.5.h),
                            decoration: BoxDecoration(
                                color: navColor,
                                borderRadius: BorderRadius.circular(14)
                            ),
                          )

                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.volunteer_activism,  color: colorBlack,),
                        label: '',
                        activeIcon: Container(
                            child: Icon(Icons.volunteer_activism,  color: colorBlack,),
                            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5),
                            margin: EdgeInsets.only(top: 1.5.h),
                            decoration: BoxDecoration(
                                color: navColor,
                                borderRadius: BorderRadius.circular(14)
                            ),
                          )

                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Feather.heart,  color: colorBlack,),
                        label: '',
                        activeIcon: Container(
                          child: Icon(Feather.heart,  color: colorBlack,),
                          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5),
                          margin: EdgeInsets.only(top: 1.5.h),
                          decoration: BoxDecoration(
                            color: navColor,
                            borderRadius: BorderRadius.circular(14)
                          ),
                        )
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Feather.settings,  color: colorBlack,),
                        label: '',
                        activeIcon: Container(
                            child: Icon(Feather.heart,  color: colorBlack,),
                            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5),
                            margin: EdgeInsets.only(top: 1.5.h),
                            decoration: BoxDecoration(
                                color: navColor,
                                borderRadius: BorderRadius.circular(14)
                            ),
                          )

                      ),
                    ],
                    currentIndex: homeMenuController.selectedIndex,
                    //selectedItemColor: Colors.amber[800],
                    onTap: homeMenuController.onItemTapped,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: primaryColorAlt,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.white,
                  );
                }
            ),
          );
        } else if(snapshot.hasError){
          return Center(
            child: Text('Something is Wrong!',style: black18MediumTextStyle,),
          );
        }
        return LoginWithPage();
      },
    );
    return Scaffold(
      backgroundColor: whiteColor,
      body: GetBuilder<HomeMenuController>(
            builder: (controller) {
              return Center(
                child: HomeMenuController.widgetOptions.elementAt(controller.selectedIndex),
              );
            }
      ),
      bottomNavigationBar: GetBuilder<HomeMenuController>(
        builder: (controller) {
          return BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Feather.home, color: colorBlack,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Feather.gift,  color: colorBlack,),
                label: 'Request',
              ),
              BottomNavigationBarItem(
                icon: Icon(Feather.heart,  color: colorBlack,),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Feather.settings,  color: colorBlack,),
                label: 'Profile',
              ),
            ],
            currentIndex: homeMenuController.selectedIndex,
            //selectedItemColor: Colors.amber[800],
            onTap: homeMenuController.onItemTapped,
            backgroundColor: Colors.red,
          );
        }
      ),
    );
  }
}
