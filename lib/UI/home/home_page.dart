import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:naan_project/UI/auth/login_with.dart';
import 'package:naan_project/UI/home/home_create_campaign_card.dart';
import 'package:naan_project/UI/home/home_suggestion_connection.dart';
import 'package:naan_project/UI/home/project_card.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';

import 'home_be_the_partner.dart';
import 'home_latest_campaign.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        leading: Icon(Feather.menu),
        backgroundColor: colorWhite,
        elevation: 0.0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo1.png'
        ),
        actions: [
          Icon(MaterialCommunityIcons.account_circle, size: 35,),
          SizedBox(width: 4.w,)
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasData){
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              height: 100.h,
              child: ListView(
                children: [
                  ProjectCard(),
                  LatestCampaign(),
                  CreateCampaignCard(),
                  SuggestedConnection(),
                  HomeBeThePartner(),
                ],
              ),
            );
          } else if(snapshot.hasError){
            return Center(
              child: Text('Something is Wrong!',style: black18MediumTextStyle,),
            );
          }
          return LoginWithPage();
          },
      ),
    );
  }
}
