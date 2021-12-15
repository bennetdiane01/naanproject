import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naan_project/UI/create_campaign/create_a_campaign_form.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class CreateCampaignCard extends StatelessWidget {
  const CreateCampaignCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 60.h,
      width: 90.w,
      //margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.10),
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 35.h,
            width: 100.w,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/5.png',
                  ),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Affected families in Afghan', style: black27SemiBoldTextStyle.copyWith(fontSize: 28, fontWeight: FontWeight.w600),),
                SizedBox(height: 2.h,),
                Row(
                  children: [
                    Image.asset(
                        'assets/images/logo2.png'
                    ),
                    SizedBox(width: 5.w,),
                    RichText(
                      text: TextSpan(
                        text: '650 ',
                        style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'of 1000 Meals',
                              style:  TextStyle(fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                    SizedBox(width: 35.w,),
                    Image.asset('assets/images/award.png')
                  ],
                ),
                SizedBox(height: 2.h,),
                Container(
                  height: 1.h,
                  color: primaryColor,
                ),
                SizedBox(height: 2.h,),
                Container(
                  height: 5.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _projectKeyWords('Afghan'),
                      _projectKeyWords('Families'),
                      _projectKeyWords('Confilict-affected'),
                    ],
                  ),
                ),
                SizedBox(height: 8.h,),
                Center(
                  child: ElevatedButton(
                    onPressed: () => {
                      Get.to(() => CreateACampaignForm()),
                    },
                    child: const Text('Start Campaign'),
                    style: ElevatedButton.styleFrom(
                      //minimumSize: const Size(10, 50),
                        elevation: 0.0,
                        primary: primaryColor, // background
                        onPrimary: Colors.white, // foreground
                        shape: const StadiumBorder(), // shape
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.5.w)
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _projectKeyWords(keyword) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Text(keyword, style: black12RegularTextStyle.copyWith(color: colorWhite),),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
