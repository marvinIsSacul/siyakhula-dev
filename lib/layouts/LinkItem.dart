
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helpers/EnvironmentHelper.dart';


class LinkItem {
  String url;
  String text;
  IconData icon;

  LinkItem({this.url, this.icon});


  static List<LinkItem> all() => [
    LinkItem(icon: FontAwesomeIcons.facebook, url: EnvironmentHelper.appFacebookPageUrl())
  ];
}
