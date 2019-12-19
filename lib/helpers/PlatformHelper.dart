
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


abstract class PlatformHelper {
  static bool isApple(BuildContext context) => Theme.of(context).platform == TargetPlatform.iOS;

  static bool isAndroid(BuildContext context) => Theme.of(context).platform == TargetPlatform.android;

  /// Whether the application is complied to run on mobile.
  static bool isPhone() => (!isWeb()); // || isApple(context) || isAndroid(context);

  /// Whether the application is complied to run on the Web.
  static bool isWeb() => kIsWeb /*&& !isPhone(context) && !isTablet(context)*/;

  // iPhone 6S 
  // |_ [portrait]
  //    |_ size: 375.0x667.0, pixelRatio: 2.0, pixels: 750.0x1334.0
  //       |_ diagonal: 765.1888655750291
  // |_ [horizontal]
  //    |_ size: 667.0x375.0, pixelRatio: 2.0, pixels: 1334.0x750.0
  //       |_ diagonal: 765.1888655750291

  // iPhone X 
  // |_ [portrait]
  //    |_ size: 375.0x812.0, pixelRatio: 3.0, pixels: 1125.0x2436.0
  //       |_ diagonal: 894.4098613052072
  // |_ [horizontal]
  //    |_ size: 812.0x375.0, pixelRatio: 3.0, pixels: 2436.0x1125.0
  //       |_ diagonal: 894.4098613052072

  // iPhone XS Max 
  // |_ [portrait]
  //    |_ size: 414.0x896.0, pixelRatio: 3.0, pixels: 1242.0x2688.0
  //       |_ diagonal: 987.0217829409845
  // |_ [horizontal]
  //    |_ size: 896.0x414.0, pixelRatio: 3.0, pixels: 2688.0x1242.0
  //       |_ diagonal: 987.0217829409845

  // iPad Pro (9.7-inch) 
  // |_ [portrait]
  //    |_ size: 768.0x1024.0, pixelRatio: 2.0, pixels: 1536.0x2048.0
  //       |_ diagonal: 1280.0
  // |_ [horizontal]
  //    |_ size: 1024.0x768.0, pixelRatio: 2.0, pixels: 2048.0x1536.0
  //       |_ diagonal: 1280.0

  // iPad Pro (10.5-inch) 
  // |_ [portrait]
  //    |_ size: 834.0x1112.0, pixelRatio: 2.0, pixels: 1668.0x2224.0
  //       |_ diagonal: 1390.0
  // |_ [horizontal]
  //    |_ size: 1112.0x834.0, pixelRatio: 2.0, pixels: 2224.0x1668.0
  //       |_ diagonal: 1390.0

  // iPad Pro (12.9-inch) 
  // |_ [portrait]
  //    |_ size: 1024.0x1366.0, pixelRatio: 2.0, pixels: 2048.0x2732.0
  //       |_ diagonal: 1707.2000468603555
  // |_ [horizontal]
  //    |_ size: 1366.0x1024.0, pixelRatio: 2.0, pixels: 2732.0x2048.0
  //       |_ diagonal: 1707.2000468603555
  static bool isTablet(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double diagonal = sqrt(size.width * size.width + size.height * size.height);
    return diagonal > 1100.0;
  }


  /// For screen sizes greater than `1200px`.
  static bool isScreenExtraLarge(BuildContext context) => MediaQuery.of(context).size.width > 1200;
  
  /// For screen sizes greater than or equal to `992px` and less than or equal to `1200px`.
  /// 
  /// [bug] Causes application to break when width is in range.
  static bool isScreenLarge(BuildContext context) => (MediaQuery.of(context).size.width >= 992 && MediaQuery.of(context).size.width <= 1200);
 
  /// For screen sizes greater than or equal to `768px` and less than `992px`.
  static bool isScreenMedium(BuildContext context) => MediaQuery.of(context).size.width >= 768 && MediaQuery.of(context).size.width < 992;
  
  /// For screen sizes greater than or equal to `576px` and less than `768px`.
  static bool isScreenSmall(BuildContext context) => MediaQuery.of(context).size.width >= 576 && MediaQuery.of(context).size.width < 768;
  
  /// For screen sizes less than `576px`.
  static bool isScreenExtraSmall(BuildContext context) => MediaQuery.of(context).size.width < 576;


  static bool isLayoutMobile(BuildContext context)
      => PlatformHelper.isPhone()
        || PlatformHelper.isScreenExtraSmall(context)
       || PlatformHelper.isScreenSmall(context)
        || PlatformHelper.isScreenMedium(context)
        || PlatformHelper.isScreenLarge(context)
        ;

  static bool isLayoutDesktop(BuildContext context) => !isLayoutMobile(context);
}
