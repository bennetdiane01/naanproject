import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:naan_project/UI/donate/donate_page_be_a_partner.dart';
import 'package:naan_project/UI/donate/donate_page_create_campaign.dart';
import 'package:naan_project/UI/donate/donate_page_send_gift.dart';
import 'package:naan_project/UI/donate/donation_page_card.dart';
import 'package:naan_project/UI/donate/dontae_detials/donate_details_page.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class DonatePage extends StatelessWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation'),
        backgroundColor: colorWhite,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () => null,
              icon: Icon(MaterialCommunityIcons.account_circle,),
          )
        ],
      ),
      body: Container(
        color: colorWhite,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            DonationPageCard(),
            /*DonatePageBeThePartner(),
            DonatePageCreateCampaign(),
            DonatePageSendGift(),*/
          ],
        ),
      ),
    );
  }
}
