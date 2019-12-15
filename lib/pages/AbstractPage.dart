
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../layouts/MenuMobileLayout.dart';
import '../layouts/HeaderMobileLayout.dart';
import '../layouts/HeaderWebLayout.dart';
import '../layouts/MenuWebLayout.dart';
import '../helpers/PlatformHelper.dart';
import '../helpers/EnvironmentHelper.dart';



abstract class AbstractPage extends StatelessWidget {

  final String pageTitle = EnvironmentHelper.appNameShort();


  Widget drawer(BuildContext context) {
    if (PlatformHelper.isMobile(context) || PlatformHelper.isScreenSmall(context))
      return Drawer(
        child: MenuMobileLayout(),
      );
    else
      return null;
  }

  void toggleDrawer(BuildContext context) {
    final scaffold = Scaffold.of(context);
    if (scaffold.isDrawerOpen) {
      Navigator.of(context).pop();
    }
    else {
      scaffold.openDrawer();
    }
  }

  Widget headerAuto(BuildContext context) {
    return /*PlatformHelper.isWeb() ||*/ PlatformHelper.isScreenExtraLarge(context) || PlatformHelper.isScreenLarge(context)
        ? HeaderWebLayout()
        : HeaderMobileLayout(this.pageTitle, () => toggleDrawer(context));
  }

  Widget menuAuto(BuildContext context) {
    return /*PlatformHelper.isWeb() || */PlatformHelper.isScreenExtraLarge(context) || PlatformHelper.isScreenLarge(context)
        ? MenuWebLayout()
        : MenuMobileLayout();
  }


  @override
  Widget build(BuildContext context);
}