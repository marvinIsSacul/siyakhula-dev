
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/StyleHelper.dart';
import '../helpers/EnvironmentHelper.dart';


class HeaderWebLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: DimensionHelper.headerHeight,
      decoration: BoxDecoration(color: ColourHelper.blackTransparent2),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.asset('assets/img/sda-logo_32.png', width: 32,),
            height: 32,
            width: 32,
            margin: EdgeInsets.all(8.0),
          ),
          Text(
            EnvironmentHelper.appName(),
            style: TextStyle(
              fontSize: 25.0,
              color: Color.fromRGBO(255, 255, 255, 1.0)
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _socialMedia('assets/img/facebook.png', EnvironmentHelper.appFacebookPageUrl()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _socialMedia(String icon, String url) => Container(
    padding: EdgeInsets.symmetric(
      vertical: DimensionHelper.spacingNormal,
      horizontal: DimensionHelper.spacingSmall
    ),
    child: GestureDetector(
      onTap: () async {
        await launch(url);
      },
      child: Image.asset(icon),
    )
  );
}
