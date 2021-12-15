import 'package:naan_project/UI/auth/auth_landing.dart';
import 'package:naan_project/UI/auth/sign_in.dart';
import 'package:naan_project/controller/onboarding_controller.dart';
import 'package:naan_project/models/onBoarding_models.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreens extends StatelessWidget {
  const OnBoardingScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // calling onboarding controller
    final onboardingController boardingController = Get.put(onboardingController());
    return GetBuilder<onboardingController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: colorWhite,
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: boardingController.pageController,
                    onPageChanged:  (int index){
                      controller.currentPage = index;
                      print('${index} y');
                      print('${controller.currentPage} g');
                    },
                    itemCount: contents.length,
                    itemBuilder: (_, i){
                      return Container(
                        //padding: const EdgeInsets.all(30),
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: secondaryColor.withOpacity(0.08)
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(30),
                              height: 60.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(contents[i].image!),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.5),
                                        BlendMode.softLight
                                    ),
                                  )
                              ),
                            ),
                            Container(
                              height: 40.h,
                              padding: EdgeInsets.all(4.w),
                              child: Column(
                                children: [
                                  Text(
                                      contents[i].title!,
                                      style: black27SemiBoldTextStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 28, fontStyle: FontStyle.normal)
                                  ),
                                  SizedBox(height: 2.h,),
                                  Expanded(
                                    child: Text(
                                      contents[i].text!,
                                      textAlign: TextAlign.left,
                                      style: black16RegularTextStyle.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  //SizedBox(height: 10.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: List.generate(contents.length, (index) {
                                            print(index);
                                            print('${controller.currentPage} gd');
                                            return _buildDot(index);
                                          }),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () => {
                                          controller.pageController!.nextPage(
                                            duration: Duration(milliseconds: 100),
                                            curve: Curves.bounceIn,
                                          ),
                                          controller.pageController!.page == 2 ? Get.to(() => AuthLanding()) : null,
                                        },
                                        child: Text('Next'),
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0.0,
                                          primary: primaryColor, // background
                                          onPrimary: Colors.white, // foreground
                                            shape: StadiumBorder(), // shape
                                          padding: EdgeInsets.symmetric(horizontal: 30)
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },

                  ),
                ),

              ],
            ),
          ),
        );
      }
    );
  }
  Container _buildDot(int Index) {
    final onboardingController boardingController = Get.put(onboardingController());
    return Container(
      height: 1.h,
      width: 1.h,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: boardingController.currentPage == Index ? primaryColor : colorWhite,
      ),
    );
  }

  /*Widget _buildNextButton() {
    return raisedButton(
        textColor: Colors.white,
        minWidth: 300,
        text: boardingController.currentPage == contents.length -1 ? "Explore" : "Next",
        height: 67.0,
        borderRadius: 10,
        color: primaryColor,
        borderSideColor: Colors.white,
        splashColor: Colors.blue[200],
        style: TextStyle(
          color: primaryColor,
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.2,
        ),

        onClick: () {
          if(boardingController.currentPage == contents.length -1) {
            *//*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GuestHomePage()),
            );*//*
          }
          boardingController._controller.nextPage(
            duration: Duration(milliseconds: 100),
            curve: Curves.bounceIn,
          );
        }
    );
  }
  Widget _buildRegtButton() {
    return raisedButton(
        textColor: Colors.white,
        minWidth: 300,
        text: currentPage == contents.length -1 ? "Register" : "Next",
        height: 67.0,
        borderRadius: 10,
        color: primaryColor,
        borderSideColor: Colors.white,
        splashColor: Colors.blue[200],
        style: TextStyle(
          color: primaryColor,
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.2,
        ),

        onClick: () {
          if(currentPage == contents.length -1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Registration()),
            );
          }
          _controller.nextPage(
            duration: Duration(milliseconds: 100),
            curve: Curves.bounceIn,
          );
        }
    );
  }

  // Register as Host
  Widget _iwantRegister(){
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterHost()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'You have a Space? Click here Register as a Host',
            style: black14MediumTextStyle.copyWith(color: darkPrimaryColor),
          ),
        ],
      ),
    );
  }

  // for login
  Widget _iwantLogin(){
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GuestLogin()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'You have an account? Click here to Login',
            style: black14MediumTextStyle.copyWith(color: darkPrimaryColor),
          ),
        ],
      ),
    );
  }*/
}
