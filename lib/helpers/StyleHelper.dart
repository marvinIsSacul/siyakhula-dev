import 'package:flutter/material.dart';


abstract class ColourHelper {
  static const accentPrimary =  const Color(0xff03adfc);
  static const accentSecondary =  const Color(0xff03dbfc);
  static const accentTertiary =  const Color(0xff03fcc2);
  static const accentLast =  const Color(0xff03fc98);
  static const blackTransparent1 = const Color(0x80000000);
  static const blackTransparent2 = const Color(0x40000000);
  static const whiteTransparent1 = const Color(0x50ffffff);
  static const white = const Color(0xfffffff6);
  static const black = const Color(0xff000000);
  static const lightBlack = const Color.fromRGBO(20, 20, 20, 0.9);
  static const iconPrimary = const Color(0xfffffffe);
}

abstract class TextStyleHelper {
  static final title = TextStyle(color: Color(0x80ffffff), fontSize: 14);
  static final buttonDefault = TextStyle(color: Color(0xffffffff), fontSize: 14);
  static final onPageHeading = TextStyle(color: Color(0xffffffff), fontSize: 48, fontWeight: FontWeight.bold);
  static final onPageDescription = TextStyle(color: Color(0xccffffff), fontSize: 16);
  static final onPageSectionHeading = TextStyle(color: Color(0xccffffff), fontSize: 16);
  static final onPageSectionDescription = TextStyle(color: Color(0xccffffff), fontSize: 14);
  static final menuLabel = TextStyle(color: ColourHelper.white, fontSize: 16);
  static final menuActive = TextStyle(color: ColourHelper.accentPrimary, fontSize: 16);
  static final normal = TextStyle(color: Color(0xffffffff), fontSize: 14, fontWeight: FontWeight.bold);
  static final normalBlack = TextStyle(color: Color(0xff000000), fontSize: 14, fontWeight: FontWeight.bold);
}

abstract class DimensionHelper {
  static const spacingSmall = 8.0;
  static const spacingNormal = 16.0;
  static const spacingLarge = 48.0;
  static const headerHeight = 55.0;
  static const menuHeight = 90.0;
}