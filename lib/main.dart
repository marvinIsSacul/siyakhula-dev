
import 'package:SiyakhulaDevelopmentAcademy/helpers/StyleHelper.dart';
import 'package:flutter/material.dart';

import 'config/Routes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en', 'ZA'),
      supportedLocales: [const Locale('en', 'ZA')],
      theme: ThemeData(
        fontFamily: 'Alegreya',
        accentColor: ColourHelper.accentPrimary,
        accentColorBrightness: Brightness.dark,
        platform: TargetPlatform.fuchsia
      ),
      initialRoute: Routes.home().routeName,
      //onUnknownRoute: ,
      routes: Routes.generateRoutes()
    );
  }
}
