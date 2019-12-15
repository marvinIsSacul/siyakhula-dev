

import 'package:flutter/material.dart';

import '../helpers/StyleHelper.dart';


class HeaderMobileLayout extends StatelessWidget {
  final String pageTitle;
  final Function onMenuPressed;

  HeaderMobileLayout(this.pageTitle, this.onMenuPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColourHelper.blackTransparent2),
      margin: EdgeInsets.only(bottom: DimensionHelper.spacingNormal),
      height: DimensionHelper.headerHeight,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Image.asset("assets/img/menu-icon.png"),
            onPressed: this.onMenuPressed,
          ),
          /*Container(
            child: Image.asset('assets/img/sda-logo_32.png', width: 32,),
            height: 32,
            width: 32,
            margin: EdgeInsets.all(8.0),
          ),
          Text(
            EnvironmentHelper.appNameShort(),
            style: TextStyle(
              fontSize: 25.0,
              color: Color.fromRGBO(255, 255, 255, 1.0)
            ),
          ),*/
          Text(
            this.pageTitle,
            style: TextStyle(
              fontSize: 25.0,
              color: Color.fromRGBO(255, 255, 255, 1.0)
            ),
          )
        ]
      )
    );
  }
}
