import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:naan_project/UI/donate/dontae_detials/donate_page_subscription.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:naan_project/widgets/textfield.dart';
import 'package:sizer/sizer.dart';
class DonationAmountPage extends StatelessWidget {
  const DonationAmountPage({Key? key}) : super(key: key);

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
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: 90.w,
            margin: EdgeInsets.all(2.h),
            decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.08),
                borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            child: Column(
              children: [
                Container(
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: tertiaryColor,
                      image: const DecorationImage(
                          image: AssetImage('assets/images/1.png'),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12))
                  ),
                ),
                SizedBox(height: 4.h,),
                Text(
                  'Choose Donation Amount',
                  style: black14MediumTextStyle.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 2.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _projectAmount(100),
                    _projectAmount(500),
                    _projectAmount(1500),
                  ],
                ),
                Text('OR', style: black14MediumTextStyle.copyWith(fontWeight: FontWeight.w700),),
                SizedBox(height: 2.h,),
                _txtAmount(),
                SizedBox(height: 3.h,),
                Center(
                  child: ElevatedButton(
                    onPressed: () => {
                      Get.to(() => DonatePageSubscription()),
                    },
                    child: const Text('Donate Now'),
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
                SizedBox(height: 3.h,),
                Text(
                  'How my donation is used?',
                  style: black14MediumTextStyle.copyWith(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 2.h,),

              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _projectAmount(amount) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
      child: Text("${amount}", style: black14MediumTextStyle.copyWith(fontWeight: FontWeight.w700),),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: colorBlack, width: 0.5)
      ),
    );
  }


  //For amount
  Widget _txtAmount() {
    //SigninController signinController = Get.put(SigninController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 9.w),
      child: TextFormFieldWidget(
        hintText: "Enter Donation Amount",
        obscureText: false,
        textInputType: TextInputType.number,
        actionKeyboard: TextInputAction.done,
        functionValidate: commonValidation,
        //controller: signinController.emailPhoneNumberController,
        onSubmitField: () {},
        parametersValidate: "Please Enter Donation Amount",
        txtColor: contentColor,
        inputLength: LengthLimitingTextInputFormatter(200),
        onChanged: () {},
        //prefixIcon: Icon(Feather.lock, color: colorBlack,),
      ),
    );
  }

}
