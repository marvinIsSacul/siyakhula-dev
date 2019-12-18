
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

  String _pageTitle;

  AbstractPage() {
    pageTitle = EnvironmentHelper.appNameShort();
  }

  set pageTitle(String title) {
    this._pageTitle = title;
    //html.window.location.href = title.replaceAll(' ', '-').toLowerCase();
  }

  get pageTitle => _pageTitle;


  Widget drawer(BuildContext context) {
    if (PlatformHelper.isPhone() || PlatformHelper.isScreenSmall(context) || PlatformHelper.isScreenExtraSmall(context)) {
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
    return PlatformHelper.isPhone()
       || PlatformHelper.isScreenExtraLarge(context) 
      || PlatformHelper.isScreenLarge(context)
      //|| PlatformHelper.isScreenMedium(context)
        ? HeaderWebLayout()
        : HeaderMobileLayout(this.pageTitle, () => this.toggleDrawer(context));
  }

  Widget menuAuto(BuildContext context) {
    return PlatformHelper.isPhone()
      || PlatformHelper.isScreenExtraLarge(context)
      || PlatformHelper.isScreenLarge(context)
      //|| PlatformHelper.isScreenMedium(context)
        ? MenuWebLayout()
        : MenuMobileLayout();
  }


  @override
  Widget build(BuildContext context);
}