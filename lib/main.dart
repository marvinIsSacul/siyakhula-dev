

import 'package:SiyakhulaDevelopmentAcademy/helpers/StyleHelper.dart';
import 'package:flutter/material.dart';


import './pages/AboutUsPage.dart';
import './pages/OurServicesPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'ProximaNova',
        accentColor: ColourHelper.accentPrimary,
        accentColorBrightness: Brightness.dark,
        platform: TargetPlatform.fuchsia
      ),
      home: AboutUsPage(),
      routes: {
        //OurServicesPage.routeName: (context) => OurServicesPage(),
        //AboutUsPage.routeName: (context) => AboutUsPage()
      }
    );
  }
}
