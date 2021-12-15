import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naan_project/UI/create_campaign/create_campaign_page.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class DonatePageCreateCampaign extends StatelessWidget {
  const DonatePageCreateCampaign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 45.h,
      width: 90.w,
      padding: EdgeInsets.all(2.h),
      margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
      decoration: BoxDecoration(
          color: secondaryColor.withOpacity(0.08),
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Column(
        children: [
          SizedBox(height: 4.h,),
          Text('Create Your Campaign', style: black22RegularBoldTextStyle.copyWith(fontWeight: FontWeight.w700),),
          SizedBox(height: 2.h,),
          Image.asset(
              'assets/images/headline.png'
          ),
          SizedBox(height: 2.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut arcu tortor sed laoreet. Magna id non nam egestas dolor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut arcu tortor sed laoreet. Magna id non nam egestas dolor.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut arcu tortor sed laoreet. Magna id non nam egestas dolor.',
              style: black14RegularTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 8.h,),
          Center(
            child: ElevatedButton.icon(
              onPressed: () => {
                Get.to(() => CreateCampaignPage()),
              },
              label: const Text('Create Campaign'),
              icon: Icon(Icons.book_outlined),
              style: ElevatedButton.styleFrom(
                //minimumSize: const Size(10, 50),
                  elevation: 0.0,
                  primary: primaryColor, // background
                  onPrimary: Colors.white, // foreground
                  shape: const StadiumBorder(), // shape
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w)
              ),
            ),
          ),

        ],
      ),
    );
  }
}
