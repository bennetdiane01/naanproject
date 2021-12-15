import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:naan_project/widgets/textfield.dart';
import 'package:sizer/sizer.dart';
class DonatePageSubscription extends StatelessWidget {
  const DonatePageSubscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate'),
        backgroundColor: colorWhite,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: ListView(
          children: [
            Container(
              ///height: 20.h,
              decoration: BoxDecoration(
                color: tertiaryColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))
              ),
              child: Column(
                children: [
                  SizedBox(height: 5.h,),
                  Text('Choose Plan', style: black16MediumTextStyle.copyWith(fontWeight: FontWeight.w600, color: colorWhite),),
                  SizedBox(height: 2.h,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut arcu tortor sed laoreet. Magna id non nam egestas dolor.',
                      style: black14RegularTextStyle.copyWith(color: colorWhite),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 5.h,),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.h),
              child: Text('Subscription Packages', style: black18MediumTextStyle.copyWith(fontWeight: FontWeight.w700),),
            ),
            Divider(
              height: 1.h,
              color: secondaryColor.withOpacity(0.50),
            ),
            Container(
              padding: EdgeInsets.all(2.h),
              margin: EdgeInsets.symmetric(vertical:1.h),
              decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  Container(
                    height: 12.h,
                    width: 12.h,
                    margin: EdgeInsets.only(right: 5.w),
                    decoration: BoxDecoration(
                        color: tertiaryColor,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Icon(Icons.verified_outlined, color: colorWhite,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Yearly', style: black14MediumTextStyle.copyWith(fontWeight: FontWeight.w700),),
                      SizedBox(height: 2.h,),
                      Text('Best Subscription Package', style: black14RegularTextStyle,),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(2.h),
              margin: EdgeInsets.symmetric(vertical:1.h),
              decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  Container(
                    height: 12.h,
                    width: 12.h,
                    margin: EdgeInsets.only(right: 5.w),
                    decoration: BoxDecoration(
                        color: tertiaryColor,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Icon(Icons.verified_outlined, color: colorWhite,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Monthly', style: black14MediumTextStyle.copyWith(fontWeight: FontWeight.w700),),
                      SizedBox(height: 2.h,),
                      Text('Best Subscription Package', style: black14RegularTextStyle,),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(2.h),
              margin: EdgeInsets.symmetric(vertical:1.h),
              decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 2.0,
                  style: BorderStyle.solid
                )
              ),
              child: Row(
                children: [
                  Container(
                    height: 12.h,
                    width: 12.h,
                    margin: EdgeInsets.only(right: 5.w),
                    decoration: BoxDecoration(
                        color: tertiaryColor,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Icon(Icons.verified_outlined, color: colorWhite,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('One Time', style: black14MediumTextStyle.copyWith(fontWeight: FontWeight.w700),),
                      SizedBox(height: 2.h,),
                      Text('Best Subscription Package', style: black14RegularTextStyle,),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.w),
              margin: EdgeInsets.only(top: 5.h),
              decoration: BoxDecoration(
                  color: primaryColorAlt,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  Container(
                    child: Text('Gift Send Form', style: black18MediumTextStyle.copyWith(fontWeight: FontWeight.w700),),
                    margin: EdgeInsets.symmetric(vertical: 4.h),
                  ),
                  _txtRecipientName(),
                  SizedBox(height: 4.h,),
                  _txtSurnameName(),
                  SizedBox(height: 4.h,),
                  _txtSendingAddress(),
                  SizedBox(height: 4.h,),
                  _txtSenderName(),
                  SizedBox(height: 4.h,),
                  _txtGiftAmount(),
                  SizedBox(height: 4.h,),
                  _deliveryDate(),
                  SizedBox(height: 4.h,),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => {
                        Get.to(() => DonatePageSubscription()),
                      },
                      child: const Text('Continue Payment'),
                      style: ElevatedButton.styleFrom(
                        //minimumSize: const Size(10, 50),
                          elevation: 0.0,
                          primary: primaryColor, // background
                          onPrimary: Colors.white, // foreground
                          shape: const StadiumBorder(), // shape
                          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 3.w)
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h,),
                ],
              ),
            ),
            SizedBox(height: 6.h,),
          ],
        ),
      ),
    );
  }

  //For recipient name
  Widget _txtRecipientName() {
    return TextFormFieldWidget(
      hintText: "Recipient Name",
      obscureText: false,
      textInputType: TextInputType.name,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      //controller: campaignController.txtCampaignNameController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Recipient Name",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(500),
      onChanged: () {},
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  //For Surname name
  Widget _txtSurnameName() {
    return TextFormFieldWidget(
      hintText: "Surname Name",
      obscureText: false,
      textInputType: TextInputType.name,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      //controller: campaignController.txtCampaignNameController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Surname Name",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(500),
      onChanged: () {},
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  //For Sending address
  Widget _txtSendingAddress() {
    return TextFormFieldWidget(
      hintText: "Sending Address",
      obscureText: false,
      textInputType: TextInputType.name,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      //controller: campaignController.txtCampaignNameController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Sending Address",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(500),
      onChanged: () {},
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  //For Sender name
  Widget _txtSenderName() {
    return TextFormFieldWidget(
      hintText: "Sender Name",
      obscureText: false,
      textInputType: TextInputType.name,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      //controller: campaignController.txtCampaignNameController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Sender Name",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(500),
      onChanged: () {},
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  //For Gift amount
  Widget _txtGiftAmount() {
    return TextFormFieldWidget(
      hintText: "Gift Amount",
      obscureText: false,
      textInputType: TextInputType.number,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      //controller: campaignController.txtCampaignNameController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Gift Amount",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(500),
      onChanged: () {},
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  // for deliver date
  Widget _deliveryDate(){
    return Container(
      height: 7.5.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(2),
        border: const Border(
            bottom: BorderSide(
              width: 4,
              color: Colors.red,
              style: BorderStyle.solid
            )
        ),
      ),
      child: Text('Delivery Date', style: black16MediumTextStyle,),
    );
  }
}
