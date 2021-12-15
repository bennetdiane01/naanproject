import 'package:flutter/material.dart';
import 'package:naan_project/UI/auth/login_with.dart';
import 'package:naan_project/UI/auth/signup.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
class AuthLanding extends StatelessWidget {
  const AuthLanding({Key? key}) : super(key: key);

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
            Text('Signin / Signup', style: black18MediumTextStyle, textAlign: TextAlign.center,),
            SizedBox(height: 3.h,),
            Center(
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => Signup());
                  },
                  child: Text('Sign up', style: TextStyle(color: primaryColor),),
                style: OutlinedButton.styleFrom(
                    primary: primaryColor, // background
                    side: BorderSide(width: 2.0, color: primaryColor),
                    shape: const StadiumBorder(), //Shape
                    padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 4.w)
                ),
              ),
            ),
            SizedBox(height: 4.h,),
            Center(
              child: ElevatedButton(
                onPressed: () => {
                Get.to(() => LoginWithPage()),

              },
                child: const Text('Log in'),
                style: ElevatedButton.styleFrom(
                  //minimumSize: const Size(10, 50),
                    elevation: 0.0,
                    primary: primaryColor, // background
                    onPrimary: Colors.white, // foreground
                    shape: const StadiumBorder(), // shape
                    padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 4.w)
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 9.w),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris feugiat erat mi, at sagittis enim pellentesque',
                style: black14SemiBoldTextStyle,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
