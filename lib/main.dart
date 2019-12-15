

import 'package:flutter/material.dart';

import './pages/OurServicesPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "ProximaNova"),
      home: OurServicesPage(),
    );
  }
}
