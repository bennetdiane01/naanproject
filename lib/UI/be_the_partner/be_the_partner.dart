import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naan_project/UI/be_the_partner/who_we_are/who_we_are.dart';
import 'package:naan_project/UI/donate/dontae_detials/donation_amount_page.dart';
import 'package:naan_project/controller/be_the_partner/be_the_partner_controller.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';

import 'current_partners.dart';
class BeThePartnerDetailsPage extends StatelessWidget {
  const BeThePartnerDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Be a Partner'),
        backgroundColor: colorWhite,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(Icons.person_pin),
          )
        ],
      ),
      body: Container(
        //height: 60.h,
        margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.10),
            borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        child: ListView(
          children: [
            Container(
              height: 35.h,
              width: 100.w,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/7.png',
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
                  Text('Be a Partner', style: black14SemiBoldTextStyle,),
                  SizedBox(height: 2.h,),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut arcu tortor sed laoreet. Magna id non nam egestas dolor. Tortor felis lacinia eros nibh eget. Enim, sem sed facilisis ac scelerisque suspendisse dignissim elementum cursus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut arcu tortor sed laoreet. Magna id non nam egestas dolor. Tortor felis lacinia eros nibh eget. Enim, sem sed facilisis ac scelerisque suspendisse dignissim elementum cursus.',
                    style: black14RegularTextStyle,
                  ),
                  SizedBox(height: 2.h,),
                  CurrentPartners(),
                  SizedBox(height: 2.h,),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => {
                        Get.to(() => WhoWeArePage()),
                      },
                      child: const Text('Become a Partner Now'),
                      style: ElevatedButton.styleFrom(
                        //minimumSize: const Size(10, 50),
                          elevation: 0.0,
                          primary: primaryColor, // background
                          onPrimary: Colors.white, // foreground
                          shape: const StadiumBorder(), // shape
                          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.w)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _projectImages(){
    return Container(
      height: 14.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 35.w,
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.10),
                borderRadius: BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                    image: AssetImage('assets/images/3.png'),
                    fit: BoxFit.cover
                )
            ),
          ),
          Container(
            width: 35.w,
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.10),
                borderRadius: BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                    image: AssetImage('assets/images/3.png'),
                    fit: BoxFit.cover
                )
            ),
          ),
          Container(
            width: 35.w,
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.10),
                borderRadius: BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                    image: AssetImage('assets/images/3.png'),
                    fit: BoxFit.cover
                )
            ),
          ),
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
