import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:naan_project/UI/auth/sign_in.dart';
import 'package:naan_project/controller/auth_controllers/facebook_auth.dart';
import 'package:naan_project/controller/auth_controllers/google_signin_controller.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class LoginWithPage extends StatelessWidget {
  LoginWithPage({Key? key}) : super(key: key);
  GoogleSignController _googleSignController = Get.put(GoogleSignController());
  FacebookAuthController facebookAuthController = Get.put(FacebookAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Container(
        height: 100.h,
        //color: Colors.red,
        color: secondaryColor.withOpacity(0.08),
        child: ListView(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 20.h,
              child: Image.asset(
                  'assets/images/logo.png'
              ),
            ),
            Text('Login With', style: black18MediumTextStyle, textAlign: TextAlign.center,),
            SizedBox(height: 3.h,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //Get.to(() => const Signup());
                  facebookAuthController.signInWithFacebook();
                },
                child: Container(
                  width: 70.w,
                  child: Row(
                    children: [
                      Icon(FontAwesome.facebook,color: colorWhite,),
                      Text(
                        'Continue with Facebook',
                        style: TextStyle(color: colorWhite),
                      )
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // background
                    shape: const StadiumBorder(), //Shape
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w)
                ),
              ),
            ),
            SizedBox(height: 4.h,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _googleSignController.googleLogin();
                  //Get.to(() => const Signup());
                },
                child: Container(
                  width: 70.w,
                  child: Row(
                    children: [
                      Icon(FontAwesome.google,color: colorBlack,),
                      SizedBox(width: 2.w,),
                      Text(
                        'Continue with Google',
                        style: TextStyle(color: colorBlack),
                      )
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, // background
                    shape: const StadiumBorder(), //Shape
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w)
                ),
              ),
            ),
            SizedBox(height: 4.h,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //Get.to(() => const Signup());
                },
                child: Container(
                  width: 70.w,
                  child: Row(
                    children: [
                      Icon(FontAwesome.apple,color: colorWhite,),
                      SizedBox(width: 2.w,),
                      Text(
                        'Continue with Apple',
                        style: TextStyle(color: colorWhite),
                      )
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, // background
                    shape: const StadiumBorder(), //Shape
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w)
                ),
              ),
            ),
            SizedBox(height: 4.h,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => SignIn());
                },
                child: Container(
                  width: 70.w,
                  child: Row(
                    children: [
                      Icon(Feather.mail,color: primaryColor,),
                      SizedBox(width: 2.w,),
                      Text(
                        'Continue with Email',
                        style: TextStyle(color: colorBlack),
                      )
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, // background
                    shape: const StadiumBorder(), //Shape
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w)
                ),
              ),
            ),
            SizedBox(height: 4.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 9.w),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris feugiat erat mi, at sagittis enim pellentesque',
                style: black14SemiBoldTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 4.h,),
          ],
        ),
      ),
    );
  }
}
