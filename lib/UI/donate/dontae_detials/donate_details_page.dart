import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naan_project/UI/donate/dontae_detials/donation_amount_page.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class DonateDetailsPage extends StatelessWidget {
  DonateDetailsPage({Key? key}) : super(key: key);

  var arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation Details'),
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
                  Text('${arguments['campaignName']}', style: black14SemiBoldTextStyle,),
                  SizedBox(height: 2.h,),
                  Text(
                    '${arguments['aboutCampaign']}',
                    style: black14RegularTextStyle,
                  ),
                  SizedBox(height: 2.h,),
                  Text('Project Images', style: black18MediumTextStyle,),
                  SizedBox(height: 2.h,),
                  _projectImages(),
                  SizedBox(height: 2.h,),
                  _projectKeyWords('${arguments['keywords'] == "" ? 'Families,Conflict-affected' : arguments['keywords']}'),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Image.asset(
                          'assets/images/logo2.png'
                      ),
                      SizedBox(width: 5.w,),
                      RichText(
                        text: TextSpan(
                          text: '${arguments['mealsRemaining']} ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'of ${arguments['mealsCount']} Meals',
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
                  Center(
                    child: ElevatedButton(
                      onPressed: () => {
                        Get.to(() => DonationAmountPage()),
                      },
                      child: const Text('Donate Now'),
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
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: arguments['campaignImage'].length,
        itemBuilder: (context, index) {
          return Container(
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
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.network(
                  '${arguments['campaignImage'][index]}',
                  fit: BoxFit.cover,)),
          );
        }
      ),
    );
  }
  Widget _projectKeyWords(keyword) {
    final tagName = keyword;
    final split = tagName.split(',');
    var values = {
      for (int i = 0; i < split.length; i++)
        i: split[i]
    };
    return Container(
      height: 5.h,
      child: ListView.builder(
          itemCount: values.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 1.w),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Text(values[index]!, style: black12RegularTextStyle.copyWith(color: colorWhite),),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }
      ),
    );
  }


}
