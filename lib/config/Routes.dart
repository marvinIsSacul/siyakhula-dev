

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/AbstractPage.dart';
import '../pages/AboutUsPage.dart';
import '../pages/OurServicesPage.dart';


abstract class Routes {
  static List<AbstractPage> primary() => [
    // MenuItem(title: 'About Us', toPage: AboutUsPage(), icon: FontAwesomeIcons.question),
    // MenuItem(title: 'Our Services', toPage: OurServicesPage(), icon: FontAwesomeIcons.cogs),
    // MenuItem(title: 'Fees', toPage: null, icon: FontAwesomeIcons.coins),
    // MenuItem(title: 'Contact Us', toPage: null, icon: FontAwesomeIcons.phoneAlt),
    // MenuItem(title: 'Join Our Team', toPage: null, icon: FontAwesomeIcons.userFriends),
    // MenuItem(title: 'Reviews', toPage: null, icon: FontAwesomeIcons.pencilAlt),
    AboutUsPage(),
    OurServicesPage(),
    
  ];

  static List<AbstractPage> secondary() => [
   // MenuItem(title: 'Report Issues', toPage: null, icon: FontAwesomeIcons.bug),
  ];

  static List<AbstractPage> tertiary() => [
    //MenuItem(title: EnvironmentHelper.appVersion(), toPage: null, icon: FontAwesomeIcons.codeBranch),
  ];

  static List<AbstractPage> all() => [
    ...primary(),
    ...secondary(),
    ...tertiary()
  ];
}