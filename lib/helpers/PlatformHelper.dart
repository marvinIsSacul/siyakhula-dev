
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


abstract class PlatformHelper {
  static bool isApple(BuildContext context) => Theme.of(context).platform == TargetPlatform.iOS;

  static bool isAndroid(BuildContext context) => Theme.of(context).platform == TargetPlatform.android;

  static bool isMobile(BuildContext context) => !isWeb() || isApple(context) || isAndroid(context);

  static bool isWeb() => kIsWeb /*&& !isMobile()*/;


  // For screen sizes greater than 1200px.
  static bool isScreenExtraLarge(BuildContext context) => MediaQuery.of(context).size.width > 1200;
  
  // For screen sizes greater than or equal to 992px.
  static bool isScreenLarge(BuildContext context) => MediaQuery.of(context).size.width >= 992 && MediaQuery.of(context).size.width <= 1200;
 
  // For screen sizes greater than or equal to 768px.
  static bool isScreenMedium(BuildContext context) => MediaQuery.of(context).size.width >= 768 && MediaQuery.of(context).size.width < 992;
  
  // For screen sizes greater than or equal to 576px.
  static bool isScreenSmall(BuildContext context) => MediaQuery.of(context).size.width >= 576 && MediaQuery.of(context).size.width < 768;
  
  // For screen sizes less than 576.
  static bool isScreenExtraSmall(BuildContext context) => MediaQuery.of(context).size.width < 576;
}
