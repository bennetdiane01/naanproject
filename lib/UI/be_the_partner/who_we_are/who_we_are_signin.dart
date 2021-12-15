import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:naan_project/controller/be_the_partner/be_the_partner_controller.dart';
import 'package:naan_project/controller/who_we_are/who_we_are_signin_controller.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:naan_project/widgets/textfield.dart';
import 'package:sizer/sizer.dart';
class WhoWeAreSignIn extends StatelessWidget {
   WhoWeAreSignIn({Key? key}) : super(key: key);
   BeThePartnerController beThePartnerController = Get.put(BeThePartnerController());

   @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colorWhite,
          body: Container(
            color: secondaryColor.withOpacity(0.08),
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Form(
              key: beThePartnerController.formKey1,
              child: ListView(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 20.h,
                    child: Image.asset(
                        'assets/images/logo.png'
                    ),
                  ),
                  Text('Food Industry', style: black18MediumTextStyle, textAlign: TextAlign.center,),
                  SizedBox(height: 3.h,),
                  _txtName(),
                  SizedBox(height: 4.h,),
                  _txtSurname(),
                  SizedBox(height: 4.h,),
                  _txtEmail(),
                  SizedBox(height: 4.h,),
                  _txtTelephone(),
                  SizedBox(height: 4.h,),
                  _txtQuantityAmount(),
                  SizedBox(height: 4.h,),
                  _txtBusinessName(),
                  SizedBox(height: 4.h,),
                  _txtAverageAmount(),
                  SizedBox(height: 4.h,),
                  beThePartnerController.arguments[0] == 'business' ? _businessType() : _foodType(),
                  SizedBox(height: 4.h,),
                  //Dropdown seach here
                  StreamBuilder<QuerySnapshot>(
                      stream: beThePartnerController.firestoreInstance.collection('campaigns').snapshots(),
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return const Center(
                            child: Text('Loading...'),
                          );
                        } else if(snapshot.hasData){
                          var items = snapshot.data!.docs;
                          List lisst = items.map((DocumentSnapshot document) => document['campaignName'].toString()).toList();
                          return Container(
                            color: colorWhite,
                            child: DropdownSearch.multiSelection(
                              mode: Mode.MENU,
                              //showSelectedItems: true,
                              items: lisst,
                              //popupItemDisabled: (String s) => s.startsWith('I'),
                              onChanged: (data){
                                beThePartnerController.donate = data;
                              },
                              dropdownSearchDecoration: const InputDecoration(
                                fillColor: Colors.white,
                                //hintText: "Select a country",
                                labelText: "Donate *",
                                contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                                border: UnderlineInputBorder(),
                              ),
                              //selectedItems: ["Brazil"],
                            ),
                          );
                        } else if(snapshot.hasError){
                          return const Center(
                            child: Text('Error...'),
                          );
                        }
                        return Text('');
                      }),
                  SizedBox(height: 4.h,),
                  _txtBusinessAddress(),
                  SizedBox(height: 4.h,),
                  _txtCountry(),
                  SizedBox(height: 4.h,),
                  _txtState(),
                  SizedBox(height: 4.h,),
                  _txtCity(),
                  SizedBox(height: 4.h,),
                  _txtZipPostal(),
                  SizedBox(height: 4.h,),
                  _txtOther(),
                  SizedBox(height: 4.h,),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => {
                        //Get.to(() => HomeMenu()),
                        beThePartnerController.createBeThePartner(),
                      },
                      child: Text('Confirm'),
                      style: ElevatedButton.styleFrom(
                        //minimumSize: const Size(10, 50),
                          elevation: 0.0,
                          primary: primaryColor, // background
                          onPrimary: Colors.white, // foreground
                          shape: const StadiumBorder(), // shape
                          padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 4.w)
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //For name
  Widget _txtName() {
    //SigninController signinController = Get.put(SigninController());
    return TextFormFieldWidget(
      hintText: "Enter Name",
      obscureText: false,
      textInputType: TextInputType.name,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      controller: beThePartnerController.txtNameController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Name",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(200),
      onChanged: () {},
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  //For surname
  Widget _txtSurname() {
    //SigninController signinController = Get.put(SigninController());
    return TextFormFieldWidget(
      hintText: "Enter Surname",
      obscureText: false,
      textInputType: TextInputType.name,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      controller: beThePartnerController.txtSurnameController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Surname",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(200),
      onChanged: () {},
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  //For email
  Widget _txtEmail() {
    //SigninController signinController = Get.put(SigninController());
    return TextFormFieldWidget(
      hintText: "Email",
      obscureText: false,
      textInputType: TextInputType.emailAddress,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      controller: beThePartnerController.txtEmailController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Email",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(200),
      onChanged: () {},
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  //For telephone
  Widget _txtTelephone() {
    //SigninController signinController = Get.put(SigninController());
    return TextFormFieldWidget(
      hintText: "Telephone",
      obscureText: false,
      textInputType: TextInputType.phone,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      controller: beThePartnerController.txtPhoneController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Telephone",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(200),
      onChanged: () {},
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  //For Quantity Amount
  Widget _txtQuantityAmount() {
    //SigninController signinController = Get.put(SigninController());
    return TextFormFieldWidget(
      hintText: "Quantity Amount",
      obscureText: false,
      textInputType: TextInputType.number,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      controller: beThePartnerController.txtQuantityController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Quantity Amount",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(200),
      onChanged: () {},
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  //For Business Name
  Widget _txtBusinessName() {
    //SigninController signinController = Get.put(SigninController());
    return TextFormFieldWidget(
      hintText: "Business Name",
      obscureText: false,
      textInputType: TextInputType.text,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      controller: beThePartnerController.txtBusinessController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Business Name",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(500),
      onChanged: () {},
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  //For Average Amount to be Donated
  Widget _txtAverageAmount() {
    //SigninController signinController = Get.put(SigninController());
    return TextFormFieldWidget(
      hintText: "Average Amount to be Donated",
      obscureText: false,
      textInputType: TextInputType.number,
      actionKeyboard: TextInputAction.next,
      functionValidate: commonValidation,
      controller: beThePartnerController.txtAmountController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Average Amount to be Donated",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(500),
      onChanged: () {},
      //prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  // for food type
  Widget _foodType(){
    WhoWeAreSignController _whoWeAreSignController = Get.put(WhoWeAreSignController());
    return MultiSelectFormField(
      autovalidate: false,
      chipBackGroundColor: primaryColor.withOpacity(0.08),
      chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
      checkBoxActiveColor: primaryColor.withOpacity(0.08),
      checkBoxCheckColor: Colors.black,
      dialogShapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: Text(
        "Food Type",
        style: TextStyle(fontSize: 16),
      ),
      dataSource: [
        {
          "display": "Running",
          "value": "Running",
        },
        {
          "display": "Climbing",
          "value": "Climbing",
        },
        {
          "display": "Walking",
          "value": "Walking",
        },
      ],
      textField: 'display',
      valueField: 'value',
      okButtonLabel: 'OK',
      cancelButtonLabel: 'CANCEL',
      //hintWidget: Text('Please choose one or more'),
      initialValue: _whoWeAreSignController.myActivities,
      onSaved: (value) {
        if (value == null) return;
        _whoWeAreSignController.myActivities = value;
        beThePartnerController.foodType = value;
      },
    );
  }
  // for business type
  Widget _businessType(){
    WhoWeAreSignController _whoWeAreSignController = Get.put(WhoWeAreSignController());
    return MultiSelectFormField(
      autovalidate: false,
      chipBackGroundColor: primaryColor.withOpacity(0.08),
      chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
      checkBoxActiveColor: primaryColor.withOpacity(0.08),
      checkBoxCheckColor: Colors.black,
      dialogShapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: Text(
        "Business Type",
        style: TextStyle(fontSize: 16),
      ),
      dataSource: [
        {
          "display": "Running",
          "value": "Running",
        },
        {
          "display": "Climbing",
          "value": "Climbing",
        },
        {
          "display": "Walking",
          "value": "Walking",
        },
      ],
      textField: 'display',
      valueField: 'value',
      okButtonLabel: 'OK',
      cancelButtonLabel: 'CANCEL',
      //hintWidget: Text('Please choose one or more'),
      initialValue: _whoWeAreSignController.myActivities,
      onSaved: (value) {
        if (value == null) return;
        _whoWeAreSignController.myActivities = value;
        beThePartnerController.foodType = value;
      },
    );
  }
   //For Business Address
   Widget _txtBusinessAddress() {
     //SigninController signinController = Get.put(SigninController());
     return TextFormFieldWidget(
       hintText: "Business Address",
       obscureText: false,
       textInputType: TextInputType.text,
       actionKeyboard: TextInputAction.next,
       functionValidate: commonValidation,
       controller: beThePartnerController.txtBuesinessAddressController,
       onSubmitField: () {},
       parametersValidate: "Please Enter Business Address",
       txtColor: contentColor,
       inputLength: LengthLimitingTextInputFormatter(500),
       onChanged: () {},
       //prefixIcon: Icon(Feather.user, color: colorBlack,),
     );
   }
   //For Country
   Widget _txtCountry() {
     //SigninController signinController = Get.put(SigninController());
     return TextFormFieldWidget(
       hintText: "Country",
       obscureText: false,
       textInputType: TextInputType.text,
       actionKeyboard: TextInputAction.next,
       functionValidate: commonValidation,
       controller: beThePartnerController.txtCountryController,
       onSubmitField: () {},
       parametersValidate: "Please Enter Country",
       txtColor: contentColor,
       inputLength: LengthLimitingTextInputFormatter(500),
       onChanged: () {},
       //prefixIcon: Icon(Feather.user, color: colorBlack,),
     );
   }
   //For State
   Widget _txtState() {
     //SigninController signinController = Get.put(SigninController());
     return TextFormFieldWidget(
       hintText: "State",
       obscureText: false,
       textInputType: TextInputType.text,
       actionKeyboard: TextInputAction.next,
       functionValidate: commonValidation,
       controller: beThePartnerController.txtStateController,
       onSubmitField: () {},
       parametersValidate: "Please Enter State",
       txtColor: contentColor,
       inputLength: LengthLimitingTextInputFormatter(500),
       onChanged: () {},
       //prefixIcon: Icon(Feather.user, color: colorBlack,),
     );
   }
   //For City
   Widget _txtCity() {
     //SigninController signinController = Get.put(SigninController());
     return TextFormFieldWidget(
       hintText: "City",
       obscureText: false,
       textInputType: TextInputType.text,
       actionKeyboard: TextInputAction.next,
       functionValidate: commonValidation,
       controller: beThePartnerController.txtCityController,
       onSubmitField: () {},
       parametersValidate: "Please Enter City",
       txtColor: contentColor,
       inputLength: LengthLimitingTextInputFormatter(500),
       onChanged: () {},
       //prefixIcon: Icon(Feather.user, color: colorBlack,),
     );
   }
   //For State/Region
   Widget _txtStateRegion() {
     //SigninController signinController = Get.put(SigninController());
     return TextFormFieldWidget(
       hintText: "State/Region",
       obscureText: false,
       textInputType: TextInputType.text,
       actionKeyboard: TextInputAction.next,
       functionValidate: commonValidation,
       //controller: beThePartnerController.emailPhoneNumberController,
       onSubmitField: () {},
       parametersValidate: "Please Enter State/Region",
       txtColor: contentColor,
       inputLength: LengthLimitingTextInputFormatter(500),
       onChanged: () {},
       //prefixIcon: Icon(Feather.user, color: colorBlack,),
     );
   }
   //For Zip/Postal
   Widget _txtZipPostal() {
     //SigninController signinController = Get.put(SigninController());
     return TextFormFieldWidget(
       hintText: "Zip/Postal",
       obscureText: false,
       textInputType: TextInputType.text,
       actionKeyboard: TextInputAction.next,
       functionValidate: commonValidation,
       controller: beThePartnerController.txtZipController,
       onSubmitField: () {},
       parametersValidate: "Please Enter Zip/Postal",
       txtColor: contentColor,
       inputLength: LengthLimitingTextInputFormatter(500),
       onChanged: () {},
       //prefixIcon: Icon(Feather.user, color: colorBlack,),
     );
   }
   //For Other
   Widget _txtOther() {
     //SigninController signinController = Get.put(SigninController());
     return TextFormFieldWidget(
       hintText: "Other",
       obscureText: false,
       textInputType: TextInputType.text,
       actionKeyboard: TextInputAction.next,
       functionValidate: commonValidation,
       controller: beThePartnerController.txtOtherController,
       onSubmitField: () {},
       parametersValidate: "Please Enter Other",
       txtColor: contentColor,
       inputLength: LengthLimitingTextInputFormatter(500),
       onChanged: () {},
       //prefixIcon: Icon(Feather.user, color: colorBlack,),
     );
   }
}
