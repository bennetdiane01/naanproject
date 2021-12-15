import 'package:flutter/material.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class CreateCampaignCard extends StatelessWidget {
  const CreateCampaignCard({Key? key}) : super(key: key);

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
          Text('Create Your Campaign', style: black18MediumTextStyle.copyWith(color: colorWhite),),
          Image.asset(
            'assets/images/headline.png'
          ),
          SizedBox(height: 1.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris feugiat erat mi, at sagittis enim pellentesque',
              style: black14RegularTextStyle.copyWith(color: colorWhite),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 2.h,),
          Center(
            child: ElevatedButton.icon(
              onPressed: () => {
                //Get.to(() => SignIn()),

              },
              label: const Text('Create Now'),
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
