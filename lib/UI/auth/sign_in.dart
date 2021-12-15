import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:naan_project/UI/auth/signup.dart';
import 'package:naan_project/UI/home/home_menu.dart';
import 'package:naan_project/controller/auth_controllers/email_controller.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:naan_project/widgets/textfield.dart';
import 'package:sizer/sizer.dart';
class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  EmailController emailController = Get.put(EmailController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colorWhite,
          body: Container(
            color: secondaryColor.withOpacity(0.08),
            padding: EdgeInsets.symmetric(horizontal: 7.w),
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
                Text('Signup', style: black18MediumTextStyle, textAlign: TextAlign.center,),
                SizedBox(height: 3.h,),
                _txtEmail(),
                SizedBox(height: 4.h,),
                _txtPassword(),
                SizedBox(height: 2.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (bool) {},
                    ),
                    Text("Forget Password?", style: black14RegularTextStyle.copyWith(color: greyTextColor),)
                  ],
                ),
                SizedBox(height: 2.h,),
                Center(
                  child: ElevatedButton(
                    onPressed: () => {
                      //Get.to(() => HomeMenu()),
                      emailController.signIn(),
                    },
                    child: const Text('Login'),
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
                SizedBox(height: 4.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: black14RegularTextStyle,),
                    SizedBox(width: 2.w,),
                    InkWell(
                      onTap: (){
                        Get.to(() => SignIn());
                      },
                      child: Text('Sign in', style: black14SemiBoldTextStyle.copyWith(color: primaryColor),),
                    ),
                  ],
                ),
                SizedBox(height: 4.h,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris feugiat erat mi, at sagittis enim pellentesque',
                    style: black14RegularTextStyle,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //For email address
  Widget _txtEmail() {
    return TextFormFieldWidget(
      hintText: "Enter Email or Phone Number",
      obscureText: false,
      textInputType: TextInputType.emailAddress,
      actionKeyboard: TextInputAction.done,
      functionValidate: commonValidation,
      controller: emailController.emailPhoneController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Email or Phone Number",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(200),
      onChanged: () {},
      prefixIcon: Icon(Feather.user, color: colorBlack,),
    );
  }
  //For email address
  Widget _txtPassword() {
    return TextFormFieldWidget(
      hintText: "Enter Password",
      obscureText: false,
      textInputType: TextInputType.emailAddress,
      actionKeyboard: TextInputAction.done,
      functionValidate: commonValidation,
      controller: emailController.passwordController,
      onSubmitField: () {},
      parametersValidate: "Please Enter Password",
      txtColor: contentColor,
      inputLength: LengthLimitingTextInputFormatter(200),
      onChanged: () {},
      prefixIcon: Icon(Feather.lock, color: colorBlack,),
    );
  }
}
