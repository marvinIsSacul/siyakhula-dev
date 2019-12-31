
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  static final List<MenuItem> _primary = [
    MenuItem<AboutUsPage>(routeName: '/about', pageTitle: 'About Us', iconData: FontAwesomeIcons.info),
    MenuItem<OurServicesPage>(routeName: '/services', pageTitle: 'Our Services', iconData: FontAwesomeIcons.cogs),
    MenuItem<ContactUsPage>(routeName: '/contact-us', pageTitle: 'Contact Us', iconData: FontAwesomeIcons.phone),
    MenuItem<FeesPage>(routeName: '/fees', pageTitle: 'Our Fees', iconData: FontAwesomeIcons.coins),
    MenuItem<JoinOurTeamPage>(routeName: '/join-our-team', pageTitle: 'Join Our Team', iconData: FontAwesomeIcons.users),
  ];

  static final List<MenuItem> _secondary = [
    MenuItem<BugReportPage>(routeName: '/bug-report', pageTitle: 'Report Bug', iconData: FontAwesomeIcons.bug),
  ];

  static final List<MenuItem> _tertiary = [

  ];

  static final List<MenuItem> _implicit = [
    MenuItem<NotFoundPage>(routeName: '/404', pageTitle: 'Not Found', iconData: FontAwesomeIcons.exclamationTriangle),
  ];


  /// The home page.
  static MenuItem home() => primary().first;

  /// All the "primary" pages.
  static List<MenuItem> primary() => _primary;

  /// All the "secondary" pages.
  static List<MenuItem> secondary() => _secondary;

  /// All the "tertiary" pages.
  static List<MenuItem> tertiary() => _tertiary;

  /// All the "implicit" pages.
  static List<MenuItem> implicit() => _implicit;

  /// All the pages.
  static List<MenuItem> all() => [
    ...primary(),
    ...secondary(),
    ...tertiary(),
    ...implicit(),
  ];


  /// Generates the app routes.
  static Map<String, Widget Function(BuildContext)> generateRoutes() {
    final Map routes = Map<String, Widget Function(BuildContext)>.fromEntries(
      // creates something like:
      // <String, Function>{ AbstractPage.pageTitle, () => AbstractPage() }
      Routes.all()
        .map<MapEntry<String, Widget Function(BuildContext)>>( (MenuItem item) => MapEntry(item.routeName, (BuildContext context) => item.getPage() ))
    );

    return routes;
  }
}



class MenuItem<T extends AbstractPage> {
  // Pages are created on Demand. This is important.
  static final Map<Type, AbstractPage Function()> _mapper = {
    AboutUsPage: () => AboutUsPage(),
    OurServicesPage: () => OurServicesPage(),
    ContactUsPage: () => ContactUsPage(),
    FeesPage: () => FeesPage(),
    JoinOurTeamPage: () => JoinOurTeamPage(),
    BugReportPage: () => BugReportPage(),
  };

  String pageTitle;
  String routeName;
  IconData iconData;
  bool isClikable;

  AbstractPage getPage() {
    return _mapper[T]()
        ..pageTitle = this.pageTitle
        ..routeName = this.routeName
        ..iconData = this.iconData;
  }

  MenuItem({this.pageTitle, this.routeName, this.iconData, this.isClikable = true});
}
