import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:naan_project/UI/auth/sign_in.dart';
import 'package:naan_project/UI/send_gift/braintree.dart';
import 'package:naan_project/UI/testing/pay_testing.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

// for pay testing
import 'package:flutter_localizations/flutter_localizations.dart';

import 'UI/onBoarding/onboarding_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: primaryMaterialColor,
          ),
          home: const OnBoardingScreens(),
          //home: SignIn(),
        );
      }
    );
  }
}

