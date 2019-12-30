
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

  static final List<LinkItem> _primary = [
    LinkItem<AboutUsPage>(routeName: '/about', pageTitle: 'About Us', iconData: FontAwesomeIcons.info),
    LinkItem<OurServicesPage>(routeName: '/services', pageTitle: 'Our Services', iconData: FontAwesomeIcons.cogs),
    LinkItem<ContactUsPage>(routeName: '/contact-us', pageTitle: 'Contact Us', iconData: FontAwesomeIcons.phone),
    LinkItem<FeesPage>(routeName: '/fees', pageTitle: 'Our Fees', iconData: FontAwesomeIcons.coins),
    LinkItem<JoinOurTeamPage>(routeName: '/join-our-team', pageTitle: 'Join Our Team', iconData: FontAwesomeIcons.users),
  ];

  static final List<LinkItem> _secondary = [
    LinkItem<BugReportPage>(routeName: '/bug-report', pageTitle: 'Report Bug', iconData: FontAwesomeIcons.bug),
  ];

  static final List<LinkItem> _tertiary = [

  ];

  static final List<LinkItem> _implicit = [
    LinkItem<NotFoundPage>(routeName: '/404', pageTitle: 'Not Found', iconData: FontAwesomeIcons.exclamationTriangle),
  ];


  /// The home page.
  static LinkItem home() => primary().first;

  /// All the "primary" pages.
  static List<LinkItem> primary() => _primary;

  /// All the "secondary" pages.
  static List<LinkItem> secondary() => _secondary;

  /// All the "tertiary" pages.
  static List<LinkItem> tertiary() => _tertiary;

  /// All the "implicit" pages.
  static List<LinkItem> implicit() => _implicit;

  /// All the pages.
  static List<LinkItem> all() => [
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
        .map<MapEntry<String, Widget Function(BuildContext)>>( (LinkItem item) => MapEntry(item.routeName, (BuildContext context) => item.getPage() ))
    );

    return routes;
  }
}



class LinkItem<T extends AbstractPage> {
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

  LinkItem({this.pageTitle, this.routeName, this.iconData, this.isClikable = true});
}
