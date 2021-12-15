import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naan_project/UI/be_the_partner/who_we_are/who_we_are_signin.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class WhoWeArePage extends StatelessWidget {
  const WhoWeArePage({Key? key}) : super(key: key);

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
            Text('Who We Are', style: black18MediumTextStyle, textAlign: TextAlign.center,),
            SizedBox(height: 3.h,),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => WhoWeAreSignIn(), arguments: ['business','food']);
                  //Get.to(() => const Signup());
                },
                child: Text('Business', style: TextStyle(color: primaryColor),),
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
                  Get.to(() => WhoWeAreSignIn(), arguments: ['food','business']),

                },
                child: const Text('Food Industry'),
                style: ElevatedButton.styleFrom(
                  //minimumSize: const Size(10, 50),
                    elevation: 0.0,
                    primary: primaryColor, // background
                    onPrimary: Colors.white, // foreground
                    shape: const StadiumBorder(), // shape
                    padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 4.w)
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
