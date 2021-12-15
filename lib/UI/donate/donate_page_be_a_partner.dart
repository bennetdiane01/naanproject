import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naan_project/UI/be_the_partner/be_the_partner.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class DonatePageBeThePartner extends StatelessWidget {
  const DonatePageBeThePartner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 45.h,
      width: 90.w,
      padding: EdgeInsets.all(2.h),
      margin: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(
          color: secondaryColor.withOpacity(0.08),
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Column(
        children: [
          Container(
            height: 8.h,
            margin: EdgeInsets.symmetric(vertical: 2.h),
            child: Image.asset(
              'assets/images/logo2.png',
              fit: BoxFit.cover,
              //height: 5.h,
            ),
          ),
          Text('Be the Partner', style: black26MediumTextStyle.copyWith(color: colorBlack, fontWeight: FontWeight.w700),),
          SizedBox(height: 3.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut arcu tortor sed laoreet. Magna id non nam egestas dolor. Tortor felis lacinia eros nibh eget. Enim, sem sed facilisis ac scelerisque suspendisse dignissim elementum cursus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut arcu tortor sed laoreet. Magna id non nam egestas dolor. Tortor felis lacinia eros nibh eget. Enim, sem sed facilisis ac scelerisque suspendisse dignissim elementum cursus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut arcu tortor sed laoreet. Magna id non nam egestas dolor. Tortor felis lacinia eros nibh eget.',
              style: black14RegularTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: Text(
              'Together, we can reach zero hunger in the world.',
              style: black14SemiBoldTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 2.h,),
          Center(
            child: ElevatedButton(
              onPressed: () => {
                Get.to(() => BeThePartnerDetailsPage()),

              },
              child: const Text('Be a Partner'),
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
