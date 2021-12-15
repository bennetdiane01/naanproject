import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:naan_project/controller/campaign_controller/latest_campaign_controller.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class LatestCampaign extends StatelessWidget {
  LatestCampaign({Key? key}) : super(key: key);

  LatestCampaignController latestCampaignController = Get.put(LatestCampaignController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 3.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Latest Campaigns', style: black18MediumTextStyle.copyWith(fontWeight: FontWeight.bold),),
            Text('View all', style: black14SemiBoldTextStyle.copyWith(color: primaryColor),)
          ],
        ),
        SizedBox(height: 2.h,),
        Container(
          height: 0.4,
          width: 100.w,
          color: primaryColor,
        ),
        SizedBox(height: 1.h,),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('campaigns').snapshots(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CupertinoActivityIndicator(),
              );
            } else if(snapshot.hasData){
              var items = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: items.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 15.h,
                      padding: EdgeInsets.all(2.h),
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.10),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 22.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/5.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width:58.w,
                                  child: Text('${items[index]['campaignName']}', style: black14SemiBoldTextStyle, overflow: TextOverflow.visible,)),
                              SizedBox(height: 2.h,),
                              Container(
                                width: 48.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.person_pin),
                                    Text('Created by', style: TextStyle(fontStyle: FontStyle.normal),),
                                    Text('${items[index]['creadtedBy'] ?? 'admn'}', style: black14SemiBoldTextStyle.copyWith(color: primaryColor),)
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }
              );
            } else if (snapshot.hasError){
              return Center(
                child: Text('Something went wrong!', style: black16MediumTextStyle,),
              );
            }
            return const Text('No data, something went wrong!');
          }
        ),
        SizedBox(height: 3.h,),

      ],
    );
  }
}
