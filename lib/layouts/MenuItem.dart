
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../pages/OurServicesPage.dart';


class MenuItem {
  final String title;
  final StatelessWidget toPage;
  final IconData icon;
  final bool isSpecialItem;
  final bool isOnlyMobile;
  final bool isOnlyWeb;

  MenuItem({@required this.title, @required this.toPage, this.icon, this.isSpecialItem = false, this.isOnlyMobile = false, this.isOnlyWeb = false});


  static List<MenuItem> all() => [
    MenuItem(title: "About Us", toPage: OurServicesPage(), icon: Icons.help_outline),
    MenuItem(title: "Our services", toPage: OurServicesPage(), icon: Icons.highlight),
    MenuItem(title: "Fees", toPage: OurServicesPage(), icon: Icons.attach_money),
    MenuItem(title: "Contact us", toPage: OurServicesPage(), icon: Icons.phone),
    MenuItem(title: "Join our team", toPage: OurServicesPage(), icon: Icons.people),
    MenuItem(title: "Reviews", toPage: OurServicesPage(), icon: Icons.rate_review),
  ];
}