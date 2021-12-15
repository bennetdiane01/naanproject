import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naan_project/UI/create_campaign/create_campaign_card.dart';
import 'package:naan_project/UI/home/home_latest_campaign.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class CreateCampaignPage extends StatelessWidget {
  const CreateCampaignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Campaign'),
        backgroundColor: colorWhite,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(Icons.settings),
          )
        ],
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        color: colorWhite,
        child: ListView(
          children: [
            CreateCampaignCard(),
            LatestCampaign(),
          ],
        ),
      ),
    );
  }
}
