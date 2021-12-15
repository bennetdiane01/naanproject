import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:naan_project/controller/campaign_controller/campaign_controller.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:naan_project/widgets/textfield.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
class CreateACampaignForm extends StatelessWidget {
  CreateACampaignForm({Key? key}) : super(key: key);
  CampaignController campaignController = Get.put(CampaignController());

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
      body: campaignController.uploading == true ? Center(
        child: CupertinoActivityIndicator(),
      ) : Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.10),
            borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              child: Text(
                'Campaign',
                style: black18MediumTextStyle.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            _txtCampaignName(),
            SizedBox(height: 4.h,),
            _txtAboutCampaign(),
            SizedBox(height: 4.h,),
            _txtKeywordsCampaign(),
            SizedBox(height: 4.h,),
            _uploadImages(),
            SizedBox(height: 4.h,),
            _campaignDuration(),
            SizedBox(height: 4.h,),
            _txtCampaigAmount(),
            SizedBox(height: 4.h,),
            _txtFacebookLink(),
            SizedBox(height: 4.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                'Note: if the enough donations are collected for the project and the campaign is not yet completed, the funds raised during the campaign will be included in the project.',
                textAlign: TextAlign.center,
                style: black16MediumTextStyle.copyWith(color: primaryColor, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 4.h,),
            Center(
              child: ElevatedButton(
                onPressed: () => {
                  campaignController.uploadImageToFirebase(),
                 // Get.to(() => DonationAmountPage()),
                },
                child: const Text('Create Campaign'),
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
            SizedBox(height: 4.h,),
          ],
        ),
      ),
    );
  }

  //For campaign name
  Widget _txtCampaignName() {
    return TextFormFieldWidget(
      hintText: "Campaign Name",
      obscureText: false,
      textInputType: TextInputType.name,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      controller: campaignController.txtCampaignNameController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Campaign Name",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(500),
      onChanged: () {},
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  //For About campaign
  Widget _txtAboutCampaign() {
    //SigninController signinController = Get.put(SigninController());
    return TextFormFieldWidget(
      hintText: "About Campaign",
      obscureText: false,
      textInputType: TextInputType.name,
      actionKeyboard: TextInputAction.newline,
      functionValidate: commonValidation,
      controller: campaignController.txtAboutCampaignController,
      onSubmitField: () {},
      parametersValidate: "Please Enter About Campaign",
      txtColor: contentColor,
      maxLine: 3,
      inputLength: LengthLimitingTextInputFormatter(50000),
      onChanged: () {

      },
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  //For keywords campaign
  Widget _txtKeywordsCampaign() {
    //SigninController signinController = Get.put(SigninController());
    return TextFormFieldWidget(
      hintText: "Keywords Campaign [seperate with comma (,) ]",
      obscureText: false,
      textInputType: TextInputType.name,
      actionKeyboard: TextInputAction.newline,
      functionValidate: commonValidation,
      controller: campaignController.txtkeywordCampaignController,
      onSubmitField: () {},
      parametersValidate: "Please Enter About Campaign",
      txtColor: contentColor,
      maxLine: 3,
      inputLength: LengthLimitingTextInputFormatter(50000),
      onChanged: () {

      },
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }

  //for upload image
  _uploadImages(){
    return Container(
      decoration: BoxDecoration(
        color: colorWhite,
        border: Border(
          bottom: BorderSide(
            style: BorderStyle.solid,
            width: 1.0,
            color: primaryColor
          )
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              'Upload Image',
              style: black14MediumTextStyle.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          IconButton(
              onPressed: (){
                //campaignController.getImageFromGallery();
                uploadImagesWidget();
              },
              icon: Icon(Icons.image))
        ],
      ),
    );
  }
  //for campaign duration
  _campaignDuration(){
    return Container(
      decoration: BoxDecoration(
        color: colorWhite,
        border: Border(
          bottom: BorderSide(
            style: BorderStyle.solid,
            width: 1.0,
            color: primaryColor
          )
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              'Campaign Duration',
              style: black14MediumTextStyle.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          IconButton(
              onPressed: (){
                campaignController.pickDateRange();
                /*final List<DateTime> picked = await DateRangePicker.showDatePicker(
                    context: context,
                    initialFirstDate: new DateTime.now(),
                    initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
                    firstDate: new DateTime(2015),
                    lastDate: new DateTime(DateTime.now().year + 2)
                );
                if (picked != null && picked.length == 2) {
                  print(picked);
                }*/
              },
              icon: Icon(Icons.calendar_today_outlined))
        ],
      ),
    );
  }
  //For Amount
  Widget _txtCampaigAmount() {
    //SigninController signinController = Get.put(SigninController());
    return TextFormFieldWidget(
      hintText: "Enter Amount",
      obscureText: false,
      textInputType: TextInputType.number,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      controller: campaignController.txtCampaignAmountController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Amount",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(500),
      onChanged: () {},
      suffixIcon: Icon(Feather.help_circle, color: colorBlack,),
    );
  }
  //For Facebook link
  Widget _txtFacebookLink() {
    //SigninController signinController = Get.put(SigninController());
    return TextFormFieldWidget(
      hintText: "Facebook Link",
      obscureText: false,
      textInputType: TextInputType.text,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      controller: campaignController.txtFacebooLinkController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Facebook Link",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(500),
      onChanged: () {},
      //suffixIcon: Icon(Feather.help_circle, color: colorBlack,),
    );
  }
// upload image UI
  uploadImagesWidget(){
    return Get.dialog(
      GetBuilder<CampaignController>(
        builder: (controller) {
          return AlertDialog(
            actions: [
              FlatButton(
              onPressed: (){
                Get.back();
              },
              child: Text('Cancel'),
              ),ElevatedButton(
              onPressed: (){
                Get.back();
                //controller.uploadImageToFirebase();
              },
              child: Text('Done'),
              ),
            ],
            content: Container(
              height: 50.h,
              width: 100.w,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    child: GridView.builder(
                        itemCount: controller.imagee.length + 1,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return index == 0
                              ? Center(
                            child: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () =>
                                !controller.uploading ? controller.getImageFromGallery() : null),
                          )
                              : Container(
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(controller.imagee[index - 1]),
                                    fit: BoxFit.cover)),
                          );
                        }),
                  ),
                  controller.uploading
                      ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Text(
                              'uploading...',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CircularProgressIndicator(
                            value: controller.val,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                          )
                        ],
                      ))
                      : Container(),
                ],
              ),
            ),
          );
        }
      ),
    );

  }
}
