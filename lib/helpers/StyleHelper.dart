import 'package:flutter/material.dart';


abstract class ColourHelper {
  static final accent =  Color(0xff1cd152);
  static final blackTransparent1 = Color(0x80000000);
  static final blackTransparent2 = Color(0x40000000);
  static final whiteTransparent1 = Color(0x50ffffff);
  static final white = Color(0xfffffff6);
  static final black = Color(0xff000000);
  static final lightBlack = Color.fromRGBO(20, 20, 20, 0.9);
  static final iconPrimary = Color(0xfffffffe);
}

abstract class TextStyleHelper {
  static final title = TextStyle(color: Color(0x80ffffff), fontSize: 14);
  static final onPageHeading = TextStyle(color: Color(0xffffffff), fontSize: 50, fontWeight: FontWeight.bold);
  static final onPageDescription = TextStyle(color: Color(0xccffffff), fontSize: 16);
  static final button = TextStyle(color: Color(0xffffffff), fontSize: 16);
  static final normal = TextStyle(color: Color(0xffffffff), fontSize: 14, fontWeight: FontWeight.bold);
  static final greenUnderline = TextStyle(color: ColourHelper.accent, fontSize: 14, decoration: TextDecoration.underline, fontWeight: FontWeight.w800);
  static final normalBlack = TextStyle(color: Color(0xff000000), fontSize: 14, fontWeight: FontWeight.bold);
}

abstract class DimensionHelper {
  static final spacingSmall = 8.0;
  static final spacingNormal = 16.0;
  static final spacingLarge = 48.0;
  static final headerHeight = 55.0;
  static final menuHeight = 90.0;
}