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
  String pageTitle;
  String routeName;
  IconData iconData;

  @protected
  static int keyId = 0;

  @protected
  final scaffoldKey = _genKey();


  AbstractPage({@required this.pageTitle, @required this.routeName, @required this.iconData}) {
    //assert(pageTitle != null && pageTitle.isNotEmpty, 'Page title should not be null or empty!');
    //assert(routeName != null && routeName.isNotEmpty, 'Route name should not be null or empty!');
    //assert(iconData != null, 'Icon data should not be null!');
    //print('created! = ' + scaffoldKey.hashCode.toRadixString(16));
  }

  static GlobalKey<ScaffoldState> _genKey() =>
    GlobalKey<ScaffoldState>(debugLabel: 'scaffoldKey#' + (++keyId).toString());
  

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

  Widget _mainPageBody(BuildContext context, Widget body) {
    final double width = MediaQuery.of(context).size.width;
    EdgeInsets padding = EdgeInsets.zero;
    final bool isScreenLargeEnough = PlatformHelper.isScreenExtraLarge(context) || PlatformHelper.isScreenLarge(context);

    if (PlatformHelper.isWeb()) {
      if (isScreenLargeEnough)
        padding = EdgeInsets.symmetric(horizontal: width * 0.10);
    }

    return Container(
      decoration: BoxDecoration(
        color: ColourHelper.white,
        shape: BoxShape.circle,
        /*gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.white10,
            Colors.white24,
            Colors.white38,
            Colors.white54,
          ]
        ),*/
       /* boxShadow: [
          BoxShadow(
            color: ColourHelper.black,
            blurRadius: 20.0
          ),
        ]*/
      ),
      padding: padding,
      child: isScreenLargeEnough ? Card(
        elevation: 2.0,
        child: body,
      )
      : body
    );
  }

  @protected
  Widget basicScaffold(BuildContext context, {@required List<Widget> body, String backgroundImage}) {
    return this._mainPageBody(
      context,
      Scaffold(
        appBar: PlatformHelper.isLayoutMobile(context) ?
            HeaderPhoneLayout(this.pageTitle, () => this.toggleDrawer(context)) as PreferredSizeWidget
            : HeaderWebLayout(this.pageTitle, () => this.toggleDrawer(context)) as PreferredSizeWidget,
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
                  //if (!PlatformHelper.isLayoutMobile(context))
                   // this.headerAuto(context),
                  if (PlatformHelper.isLayoutDesktop(context))
                    this.menuAuto(context),
                ],
              )
          ]
        )
      )
    )
    );
  }

  @protected
  Widget basicScaffoldWithPageIndicator(BuildContext context, List<Widget> pageInidicatorChildren, [Widget floatingActionButton]) {
    return this._mainPageBody(
      context,
      Scaffold(
      key: this.scaffoldKey,
      drawer: this.drawer(context),
      appBar: PlatformHelper.isLayoutMobile(context) ?
            HeaderPhoneLayout(this.pageTitle, () => this.toggleDrawer(context)) as PreferredSizeWidget
            : HeaderWebLayout(this.pageTitle, () => this.toggleDrawer(context)) as PreferredSizeWidget,
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
                 // if (!PlatformHelper.isLayoutMobile(context))
                  //  this.headerAuto(context),
                  if (PlatformHelper.isLayoutDesktop(context))
                    this.menuAuto(context),
                ]
              )
            ]
          )
        ),
        floatingActionButton: floatingActionButton,
        //bottomNavigationBar: ContactUsPage(),
      )
    );
  }

  @override
  Widget build(BuildContext context);
}
