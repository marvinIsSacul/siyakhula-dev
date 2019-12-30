import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_indicator/page_indicator.dart';

import '../../layouts/HeaderMobileLayout.dart';
import '../../layouts/HeaderPhoneLayout.dart';
import '../../layouts/MenuMobileLayout.dart';
import '../../layouts/HeaderWebLayout.dart';
import '../../layouts/MenuWebLayout.dart';
import '../../helpers/PlatformHelper.dart';
import '../../helpers/StyleHelper.dart';


abstract class AbstractPage extends StatelessWidget {
  final String pageTitle;
  final String routeName;
  final IconData iconData;
  final bool isEnabled;
  static int _keyId = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKey#' + (++_keyId).toString());


  AbstractPage({@required this.pageTitle, @required this.routeName, @required this.iconData, this.isEnabled = true}) {
    //assert(pageTitle != null && pageTitle.isNotEmpty, 'Page title should not be null or empty!');
    //assert(routeName != null && routeName.isNotEmpty, 'Route name should not be null or empty!');
    //assert(iconData != null, 'Icon data should not be null!');
    //print('created! = ' + scaffoldKey.hashCode.toRadixString(16));
  }

  @protected
  Widget drawer(BuildContext context) {
    if (PlatformHelper.isLayoutMobile(context)) {
      return MenuMobileLayout();
    }
    else {
      // toggleDrawer(context, onlyClose: true); // crashes app if Web.
      return null;
    }
  }

  @protected
  void toggleDrawer(BuildContext context, {bool onlyClose = false}) {
    if (this.scaffoldKey.currentState.isDrawerOpen) {
      Navigator.pop(this.scaffoldKey.currentState.context);
    }
    else {
      this.scaffoldKey.currentState.openDrawer();
    }
  }

  @protected
  Widget headerAuto(BuildContext context) {
    return PlatformHelper.isLayoutMobile(context)
        ? HeaderMobileLayout(this.pageTitle, () => this.toggleDrawer(context))
        : HeaderWebLayout();
  }

  @protected
  Widget menuAuto(BuildContext context) {
    return PlatformHelper.isLayoutMobile(context)
        ? MenuMobileLayout()
        : MenuWebLayout();
  }

  @protected
  Widget basicScaffold(BuildContext context, {@required List<Widget> body, String backgroundImage}) {
    return Scaffold(
        appBar: PlatformHelper.isPhone() ? HeaderPhoneLayout(this.pageTitle, () => this.toggleDrawer(context)) : null,
        key: this.scaffoldKey,
        drawer: this.drawer(context),
        body: Builder(
          builder: (BuildContext context) =>
            Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: DimensionHelper.spacingNormal),
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: ColourHelper.blackTransparent1,
                    backgroundBlendMode: BlendMode.overlay,
                    image: DecorationImage(
                      //image: AssetImage(service.image),
                      image: AssetImage(
                          PlatformHelper.isLayoutMobile(context)
                              ? (backgroundImage ?? 'assets/img/default-background-2_md.jpg')
                              : (backgroundImage ?? 'assets/img/default-background-2_lg.jpg')
                      ),
                      fit: BoxFit.cover
                    )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Container(height: 100),
                        Card(
                          color: ColourHelper.blackTransparent1,
                          elevation: 1.0,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Column(children: body)
                          )
                        )
                      ],
                  )
                )
              ),
              Column(
                children: <Widget>[
                  if (PlatformHelper.isWeb())
                    this.headerAuto(context),
                  if (PlatformHelper.isLayoutDesktop(context))
                    this.menuAuto(context),
                ],
              )
          ]
        )
      )
    );
  }

  @protected
  Widget basicScaffoldWithPageIndicator(BuildContext context, List<Widget> pageInidicatorChildren) {
    return Scaffold(
      key: this.scaffoldKey,
      drawer: this.drawer(context),
      appBar: PlatformHelper.isPhone() ? HeaderPhoneLayout(this.pageTitle, () => this.toggleDrawer(context)) : null,
      body: Builder(
        builder: (BuildContext context) =>
          Stack(
            fit: StackFit.expand,
            children: <Widget>[
              PageIndicatorContainer(
                length: pageInidicatorChildren.length,
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
                indicatorSpace: DimensionHelper.spacingNormal,
                indicatorColor: ColourHelper.white,
                indicatorSelectorColor: ColourHelper.accentPrimary,
                child: PageView(children: pageInidicatorChildren),
              ),
              Column(
                children: <Widget>[
                  if (PlatformHelper.isWeb())
                    this.headerAuto(context),
                  if (PlatformHelper.isLayoutDesktop(context))
                    this.menuAuto(context),
                ]
              )
            ]
          )
        ),
        //bottomNavigationBar: ContactUsPage(),
      );
  }

  @override
  Widget build(BuildContext context);
}