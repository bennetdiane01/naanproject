import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


String url = ''; // for URL

var primaryColor = const Color(0xff815600);
var primaryColorAlt = const Color(0xfff2efe8);
var navColor = const Color(0xfff9debb);
var secondaryColor = const Color(0xff815600);
var tertiaryColor = const Color(0xff4F6440);
var headerColor = const Color(0xff34302A);
var linesColor = const Color(0xff262626);
var contentColor = const Color(0xffF9DEBB);
var textFieldColor = const Color(0xff393F45);
var inactiveMenuColor = const Color(0xff9C9C9C);
var artboardColor = const Color(0xff151515);
var cardBGColor = const Color(0xff2D2D2D);
var secondaryDarkLineColor = const Color(0xff705728);
var colorBlack = Colors.black;
var colorRed = Colors.red;
var colorWhite = Colors.white;
var colorGrey = const Color(0xffC4C4C4);
var colorStarRed = const Color(0xffFF0000);

Color darkPrimaryColor = const Color(0xFF1B5E20);
Color bottomBarGreyColor = const Color(0xFF999999);
Color lightGreyColor = const Color(0xFFCFCFCF);
Color blackColor = Colors.black;
Color whiteColor = Colors.white;
Color greyTextColor = const Color(0xFF7F7F7F);
Color lightGreyTextFieldBGColor = const Color(0xFFEFEFEF);
Color lightlGreen  = const Color(0xffFAFAFA);
Color lightDGreen  = const Color(0xFF84CCB1);



double fixPadding = 10.0;

SizedBox heightSpace = const SizedBox(height: 10.0);

SizedBox widthSpace = const SizedBox(width: 10.0);

TextStyle appBarTextStyle = GoogleFonts.openSans(
  fontSize: 16.0,
  color: whiteColor,
  fontWeight: FontWeight.w600,
);

TextStyle whiteSmallTextStyle = GoogleFonts.openSans(
  fontSize: 12.0,
  color: whiteColor,
);

TextStyle white42SemiBoldTextStyle = GoogleFonts.openSans(
  fontSize: 42.0,
  color: whiteColor,
  fontWeight: FontWeight.w600,
);

TextStyle white16RegularTextStyle = GoogleFonts.openSans(
  fontSize: 16.0,
  color: whiteColor,
);

TextStyle white14MediumTextStyle = GoogleFonts.openSans(
  fontSize: 14.0,
  color: whiteColor,
  fontWeight: FontWeight.w500,
);

TextStyle white18SemiBoldTextStyle = GoogleFonts.openSans(
  fontSize: 18.0,
  color: whiteColor,
  fontWeight: FontWeight.w600,
);

TextStyle white20SemiBoldTextStyle = GoogleFonts.openSans(
  fontSize: 20.0,
  color: whiteColor,
  fontWeight: FontWeight.w600,
);

TextStyle white16MediumTextStyle = GoogleFonts.openSans(
  fontSize: 16.0,
  color: whiteColor,
  fontWeight: FontWeight.w500,
);

TextStyle white12SemiBoldTextStyle = GoogleFonts.openSans(
  fontSize: 12.0,
  color: whiteColor,
  fontWeight: FontWeight.w600,
);

TextStyle black12RegularTextStyle = GoogleFonts.openSans(
  fontSize: 12.0,
  color: blackColor,
);

TextStyle black14RegularTextStyle = GoogleFonts.openSans(
  fontSize: 14.0,
  color: blackColor,
);

TextStyle black16RegularTextStyle = GoogleFonts.openSans(
  fontSize: 16.0,
  color: blackColor,
);

TextStyle black16MediumTextStyle = GoogleFonts.openSans(
  fontSize: 16.0,
  color: blackColor,
  fontWeight: FontWeight.w500,
);

TextStyle black14MediumTextStyle = GoogleFonts.openSans(
  fontSize: 14.0,
  color: blackColor,
  fontWeight: FontWeight.w500,
);

TextStyle black26MediumTextStyle = GoogleFonts.openSans(
  fontSize: 26.0,
  color: blackColor,
  fontWeight: FontWeight.w500,
);

TextStyle black18MediumTextStyle = GoogleFonts.openSans(
  fontSize: 18.0,
  color: blackColor,
  fontWeight: FontWeight.w500,
);

TextStyle black14SemiBoldTextStyle = GoogleFonts.openSans(
  fontSize: 14.0,
  color: blackColor,
  fontWeight: FontWeight.w600,
);

TextStyle black16SemiBoldTextStyle = GoogleFonts.openSans(
  fontSize: 16.0,
  color: blackColor,
  fontWeight: FontWeight.w600,
);

TextStyle black22RegularBoldTextStyle = GoogleFonts.openSans(
  fontSize: 22.0,
  color: blackColor,
  fontWeight: FontWeight.w400,
);

TextStyle black27SemiBoldTextStyle = GoogleFonts.openSans(
  fontSize: 27.0,
  color: blackColor,
  fontWeight: FontWeight.w700,
);

TextStyle grey14MediumTextStyle = GoogleFonts.openSans(
  fontSize: 14.0,
  color: greyTextColor,
  fontWeight: FontWeight.w500,
);

TextStyle grey20MediumTextStyle = GoogleFonts.openSans(
  fontSize: 20.0,
  color: greyTextColor,
  fontWeight: FontWeight.w500,
);

TextStyle grey12RegularTextStyle = GoogleFonts.openSans(
  fontSize: 12.0,
  color: greyTextColor,
);

TextStyle grey14RegularTextStyle = GoogleFonts.openSans(
  fontSize: 14.0,
  color: greyTextColor,
);

TextStyle red12RegularTextStyle = GoogleFonts.openSans(
  fontSize: 12.0,
  color: Colors.red,
);

TextStyle red14RegularTextStyle = GoogleFonts.openSans(
  fontSize: 14.0,
  color: Colors.red,
);

TextStyle red16MediumTextStyle = GoogleFonts.openSans(
  fontSize: 16.0,
  color: Colors.red,
  fontWeight: FontWeight.w500,
);

TextStyle green12RegularTextStyle = GoogleFonts.openSans(
  fontSize: 12.0,
  color: Colors.green,
);

TextStyle green14RegularTextStyle = GoogleFonts.openSans(
  fontSize: 14.0,
  color: Colors.green,
);

TextStyle primaryColor16MediumTextStyle = GoogleFonts.openSans(
  fontSize: 16.0,
  color: primaryColor,
  fontWeight: FontWeight.w500,
);

var shadowStyle = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(10)),
  color: colorWhite,
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 10.0, // soften the shadow
      spreadRadius: 1.0, //extend the shadow
      offset: Offset(
        0.0, // Move to right 10  horizontally
        0.0, // Move to bottom 10 Vertically
      ),
    )
  ],
);

const MaterialColor primaryMaterialColor = MaterialColor(
  0xffF8B132,
  <int, Color>{
    50: Color(0xffF8B132),
    100: Color(0xffF8B132),
    200: Color(0xffF8B132),
    300: Color(0xffF8B132),
    400: Color(0xffF8B132),
    500: Color(0xffF8B132),
    600: Color(0xffF8B132),
    700: Color(0xffF8B132),
    800: Color(0xffF8B132),
    900: Color(0xffF8B132),
  },
);
