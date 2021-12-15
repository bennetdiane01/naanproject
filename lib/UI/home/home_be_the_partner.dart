import 'package:flutter/material.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class HomeBeThePartner extends StatelessWidget {
  const HomeBeThePartner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      padding: EdgeInsets.all(2.h),
      margin: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(
          color: tertiaryColor,
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Column(
        children: [
          Image.asset(
              'assets/images/logo2.png',
            height: 5.h,
          ),
          Text('Be The Partner', style: black18MediumTextStyle.copyWith(color: colorWhite),),
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: '650 ',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'of 1000 Meals',
                        style:  TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              SizedBox(width: 1.w,),
              Text('|', style: TextStyle(color: Colors.white60),),
              SizedBox(width: 1.w,),
              RichText(
                text: TextSpan(
                  text: '650 ',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'of 1000 Meals',
                        style:  TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut arcu tortor sed laoreet. Magna id non nam egestas dolor. Tortor felis lacinia eros nibh eget. Enim, sem sed facilisis ac scelerisque suspendisse dignissim elementum cursus.',
              style: black14RegularTextStyle.copyWith(color: colorWhite),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: Text(
              'Together, we can reach zero hunger in the world.',
              style: black14SemiBoldTextStyle.copyWith(color: colorWhite),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 2.h,),
          Center(
            child: ElevatedButton(
              onPressed: () => {
                //Get.to(() => SignIn()),

              },
              child: const Text('Learn More'),
              style: ElevatedButton.styleFrom(
                //minimumSize: const Size(10, 50),
                  elevation: 0.0,
                  primary: primaryColor, // background
                  onPrimary: Colors.white, // foreground
                  shape: const StadiumBorder(), // shape
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.w)
              ),
            ),
          ),

        ],
      ),
    );
  }
}
