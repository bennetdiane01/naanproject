import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naan_project/UI/send_gift/send_gift_details.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class DonatePageSendGift extends StatelessWidget {
  const DonatePageSendGift({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 45.h,
      width: 90.w,
      margin: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
          color: secondaryColor.withOpacity(0.08),
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Column(
        children: [
          Container(
            width: 100.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: tertiaryColor,
              image: DecorationImage(image: AssetImage('assets/images/6.png')),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12))
            ),
          ),
          SizedBox(height: 4.h,),
          Text(
            'Looking for the Perfect Gift?',
            style: black18MediumTextStyle.copyWith(fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 2.h,),
          Text('Honour loved ones with a gift Donations', style: black14RegularTextStyle,),
          SizedBox(height: 8.h,),
          Center(
            child: ElevatedButton(
              onPressed: () => {
                //Get.to(() => SignIn()),
                Get.to(() => SendGiftDetails()),


              },
              child: const Text('Send Gift'),
              style: ElevatedButton.styleFrom(
                //minimumSize: const Size(10, 50),
                  elevation: 0.0,
                  primary: primaryColor, // background
                  onPrimary: Colors.white, // foreground
                  shape: const StadiumBorder(), // shape
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.w)
              ),
            ),
          ),

        ],
      ),
    );
  }
}
