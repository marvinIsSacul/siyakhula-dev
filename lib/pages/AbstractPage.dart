
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:html' as html;

import '../layouts/MenuMobileLayout.dart';
import '../layouts/HeaderMobileLayout.dart';
import '../layouts/HeaderWebLayout.dart';
import '../layouts/MenuWebLayout.dart';
import '../helpers/PlatformHelper.dart';
import '../helpers/EnvironmentHelper.dart';



abstract class AbstractPage extends StatelessWidget {

  String pageTitle;
  String routeName;
  IconData iconData;


  AbstractPage({this.pageTitle, this.routeName, this.iconData});

  Widget drawer(BuildContext context) {
    if (PlatformHelper.isLayoutMobile(context)) {
      return MenuMobileLayout();
    }
    else {
     // toggleDrawer(context, onlyClose: true); // crashes app if Web.
      return null;
    }
  }

  void toggleDrawer(BuildContext context, {bool onlyClose = false}) {
    final scaffold = Scaffold.of(context);
    if (scaffold.isDrawerOpen) {
      Navigator.of(context).pop();
    }
    else if (!onlyClose) {
      scaffold.openDrawer();
    }
  }

  Widget headerAuto(BuildContext context) {
    return PlatformHelper.isLayoutMobile(context)
        ? HeaderMobileLayout(this.pageTitle, () => this.toggleDrawer(context))
        : HeaderWebLayout();
  }

  Widget menuAuto(BuildContext context) {
    return 
      PlatformHelper.isLayoutMobile(context)
        ? MenuMobileLayout()
        : MenuWebLayout();
  }


  @override
  Widget build(BuildContext context);
}