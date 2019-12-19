
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../helpers/EnvironmentHelper.dart';

import '../pages/OurServicesPage.dart';
import '../pages/AboutUsPage.dart';



class MenuItem {
  final String title;
  final StatelessWidget toPage;
  final IconData icon;
  final bool isOnlyMobile;
  final bool isOnlyWeb;

  MenuItem({@required this.title, @required this.toPage, this.icon, this.isOnlyMobile = false, this.isOnlyWeb = false});


  static List<MenuItem> primary() => [
    MenuItem(title: 'About Us', toPage: AboutUsPage(), icon: FontAwesomeIcons.question),
    MenuItem(title: 'Our Services', toPage: OurServicesPage(), icon: FontAwesomeIcons.cog),
    MenuItem(title: 'Fees', toPage: null, icon: FontAwesomeIcons.coins),
    MenuItem(title: 'Contact Us', toPage: null, icon: FontAwesomeIcons.phoneAlt),
    MenuItem(title: 'Join Our Team', toPage: null, icon: FontAwesomeIcons.users),
    MenuItem(title: 'Reviews', toPage: null, icon: FontAwesomeIcons.star),
  ];

  static List<MenuItem> secondary() => [
    MenuItem(title: 'Report Issues', toPage: null, icon: FontAwesomeIcons.bug),
  ];

  static List<MenuItem> tertiary() => [
    MenuItem(title: EnvironmentHelper.appVersion(), toPage: null, icon: FontAwesomeIcons.codeBranch),
  ];

  static List<MenuItem> all() => [
    ...primary(),
    ...secondary(),
    ...tertiary()
  ];
}