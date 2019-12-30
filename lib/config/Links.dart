
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helpers/EnvironmentHelper.dart';


class Links {
  String url;
  String text;
  IconData icon;

  Links({this.url, this.icon});

  static List<Links> all() => [
    Links(icon: FontAwesomeIcons.facebook, url: EnvironmentHelper.appFacebookPageUrl())
  ];
}
