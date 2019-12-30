

import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helpers/EnvironmentHelper.dart';
import '../helpers/PlatformHelper.dart';
import '../pages/ContactUsPage.dart';
import '../pages/FeesPage.dart';
import '../pages/JoinOurTeamPage.dart';
import '../pages/NotFoundPage.dart';
import '../pages/abstract/AbstractPage.dart';
import '../pages/AboutUsPage.dart';
import '../pages/OurServicesPage.dart';
import '../pages/BugReportPage.dart';


/// The app routes.
class Routes {
  static const int _homePageIndex = 0;
  

  static final List<AbstractPage> _primary = [
    AboutUsPage(),
    OurServicesPage(),
    ContactUsPage(),
    FeesPage(),
    JoinOurTeamPage()
  ];

  static final List<AbstractPage> _secondary = [
    if (PlatformHelper.isPhone()) BugReportPage(),
  ];

  static final List<AbstractPage> _tertiary = [
    _NonePage(pageTitle: EnvironmentHelper.appVersion(), iconData: FontAwesomeIcons.codeBranch),
  ];

  static final List<AbstractPage> _implicit = [
    NotFoundPage()
  ];


  /// The home page.
  static AbstractPage home() => _primary[_homePageIndex];

  /// All the "primary" pages.
  static List<AbstractPage> primary() => _primary;

  /// All the "secondary" pages.
  static List<AbstractPage> secondary() => _secondary;

  /// All the "tertiary" pages.
  static List<AbstractPage> tertiary() => _tertiary;

  /// All the "tertiary" pages.
  static List<AbstractPage> implicit() => _implicit;

  /// All the pages.
  static List<AbstractPage> all() => [
    ...primary(),
    ...secondary(),
    ...tertiary(),
    ...implicit(),
  ];


  /// Generates the app routes.
  static Map<String, Widget Function(BuildContext)> generateRoutes() {
    //assert(_routeConfigCount == 0, 'Routes should be generated only once!');

    //print('size: ' + Routes.all().length.toString());

    final Map routes = Map<String, Widget Function(BuildContext)>(); /*.fromEntries(
      // creates something like:
      // <String, Function>{ AbstractPage.pageTitle, () => AbstractPage() }
      Routes.all()
        .map<MapEntry<String, Widget Function(BuildContext)>>( (AbstractPage page) => MapEntry(page.routeName, (BuildContext context) => page ))
    );
*/
    // "root" route.
    routes.addAll(<String, Widget Function(BuildContext)>{
      '/': (context) => home(),
      '/about': (context) => AboutUsPage(),
      '/services': (context) => OurServicesPage(),
      '/contact-us': (context) => ContactUsPage(),
      '/bug-report': (context) => BugReportPage(),
      '/fees': (context) => FeesPage(),
      '/join-our-team': (context) => JoinOurTeamPage()
    });

   // _routeConfigCount++;

    return routes;
  }
}

class _NonePage extends AbstractPage {

  _NonePage({String pageTitle, IconData iconData})
    : super(isEnabled: false, routeName: '', pageTitle: pageTitle, iconData: iconData);
  
  @override
  Widget build(BuildContext context) {
    assert(false, "Page is not supposed to be drawn!");
    return null;
  }

}
