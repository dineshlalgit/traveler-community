import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color kPrimaryColor = Color.fromRGBO(253, 102, 51, 1);
Color kBackgroundColor = Color.fromRGBO(246, 246, 246, 1);
Color kShadowColor = Color(0xFFC0C0C0);

TextStyle kDefaultFont = GoogleFonts.montserrat();

TextStyle kTitleTextStyle = GoogleFonts.pacifico().copyWith(
  fontSize: 40,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

TextStyle kSubtitleTextStyle = kDefaultFont.copyWith(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.w300,
);

TextStyle kBoxSearchTextStyle = kDefaultFont.copyWith(
  fontSize: 16,
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
);

TextStyle kSectionTitleTextStyle = kDefaultFont.copyWith(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

TextStyle kMoreDetailsTextStyle = kDefaultFont.copyWith(
  fontSize: 16,
  color: kPrimaryColor,
  decoration: TextDecoration.underline,
);

TextStyle kSmallCardTextStyle = kDefaultFont.copyWith(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

InputDecoration kDefaultInput = InputDecoration(
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
);

var kCardShadow = [
  BoxShadow(
    offset: new Offset(4, 4),
    blurRadius: 4,
    color: kShadowColor,
  ),
  BoxShadow(
    offset: new Offset(-1, 0),
    color: kShadowColor,
  )
];

BoxDecoration kCardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(15),
  boxShadow: kCardShadow,
);