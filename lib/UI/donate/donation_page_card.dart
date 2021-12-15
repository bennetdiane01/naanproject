import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listview_ex/listview_ex.dart';
import 'package:naan_project/UI/donate/donate_page_create_campaign.dart';
import 'package:naan_project/UI/donate/dontae_detials/donate_details_page.dart';
import 'package:naan_project/controller/home/home_page_controller.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import 'donate_page_be_a_partner.dart';
import 'donate_page_send_gift.dart';
class DonationPageCard extends StatelessWidget {
  DonationPageCard({Key? key}) : super(key: key);

  HomePageController homePageController = Get.put(HomePageController());

  var itemData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    List numbers;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('campaigns').snapshots(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }
        else if(snapshot.hasData){
          var items = snapshot.data!.docs;
          return Container(
            width: 100.w,
            child: ListViewEx.builder(
              scrollDirection: Axis.horizontal,
              footer: Row(
                children: [
                  DonatePageBeThePartner(),
                  DonatePageCreateCampaign(),
                  DonatePageSendGift()
                ],
              ),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(() => DonateDetailsPage(), arguments: items[index]);
                      },
                      child: Container(
                        //height: 60.h,
                        width: 88.w,
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
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
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                                  child: Image.network(items[index]['campaignImage'][0], fit: BoxFit.cover,)),
                            ),

                            Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(items[index]['campaignName'], style: black27SemiBoldTextStyle.copyWith(fontSize: 28, fontWeight: FontWeight.w600),),
                                  SizedBox(height: 2.h,),
                                  Row(
                                    children: [
                                      Image.asset(
                                          'assets/images/logo2.png'
                                      ),
                                      SizedBox(width: 5.w,),
                                      RichText(
                                        text: TextSpan(
                                          text: '${items[index]['mealsRemaining'] ?? 0}  ',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'of ${items[index]['mealsCount'] ?? 0000} Meals',
                                              style:  TextStyle(fontWeight: FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 30.w,),
                                      Image.asset('assets/images/award.png')
                                    ],
                                  ),
                                  SizedBox(height: 2.h,),
                                  LinearPercentIndicator(
                                    //width: 100.w,
                                    lineHeight: 6.0,
                                    percent: 0.5,
                                    backgroundColor: Colors.grey,
                                    progressColor: primaryColor,
                                  ),
                                  SizedBox(height: 2.h,),
                                  _projectKeyWords('${items[index]['keywords'] == "" ? 'Families,Conflict-affected' : items[index]['keywords']}'),
                                  SizedBox(height: 8.h,),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () => {
                                        //Get.to(() => SignIn()),

                                      },
                                      child: const Text('Donate Now'),
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
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        };
        return const Text('');

      }
    );
    return Container(
      height: 100.h,
      width: 90.w,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.10),
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('campaigns').snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
          else if (snapshot.hasData){
            var items = snapshot.data!.docs;
            print('the '+items.length.toString());
            return Container(
              margin: EdgeInsets.only(right: 20),
              width: 70.w,
              height: 100.h,
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length + 2,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if(items == items.length){
                      return Text('Yes');
                    } else {
                      return Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Get.to(() => DonateDetailsPage(), arguments: items[index]);
                            },
                            child: Container(
                              //height: 60.h,
                              width: 88.w,
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
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
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                                        child: Image.network(items[index]['campaignImage'][0], fit: BoxFit.cover,)),
                                  ),

                                  Container(
                                    margin: EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(items[index]['campaignName'], style: black27SemiBoldTextStyle.copyWith(fontSize: 28, fontWeight: FontWeight.w600),),
                                        SizedBox(height: 2.h,),
                                        Row(
                                          children: [
                                            Image.asset(
                                                'assets/images/logo2.png'
                                            ),
                                            SizedBox(width: 5.w,),
                                            RichText(
                                              text: TextSpan(
                                                text: '${items[index]['mealsRemaining'] ?? 0}  ',
                                                style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: 'of ${items[index]['mealsCount'] ?? 0000} Meals',
                                                    style:  TextStyle(fontWeight: FontWeight.normal),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 30.w,),
                                            Image.asset('assets/images/award.png')
                                          ],
                                        ),
                                        SizedBox(height: 2.h,),
                                        LinearPercentIndicator(
                                          //width: 100.w,
                                          lineHeight: 6.0,
                                          percent: 0.5,
                                          backgroundColor: Colors.grey,
                                          progressColor: primaryColor,
                                        ),
                                        SizedBox(height: 2.h,),
                                        _projectKeyWords('${items[index]['keywords'] == "" ? 'Families,Conflict-affected' : items[index]['keywords']}'),
                                        SizedBox(height: 8.h,),
                                        Center(
                                          child: ElevatedButton(
                                            onPressed: () => {
                                              //Get.to(() => SignIn()),

                                            },
                                            child: const Text('Donate Now'),
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
                            ),
                          ),
                        ],
                      );
                    }
                  }
              ),
            );
          } else if(snapshot.hasError){
            return Center(
              child: Text('Something went wrong!', style: black16MediumTextStyle,),
            );
          }
          return const Text('');
        }
      ),
    );
  }
  Widget _projectKeyWords(keyword) {
    final tagName = keyword;
    final split = tagName.split(',');
    final Map<int, String> values = {
      for (int i = 0; i < split.length; i++)
        i: split[i]
    };
    return Container(
      height: 5.h,
      width: 100.w,
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
