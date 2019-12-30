

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helpers/StyleHelper.dart';
import 'abstract/AbstractHeader.dart';


class HeaderMobileLayout extends AbstractHeader {
  
  HeaderMobileLayout(String pageTitle, Function onMenuPressed) : super(pageTitle, onMenuPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColourHelper.blackTransparent2),
      margin: EdgeInsets.only(bottom: DimensionHelper.spacingNormal),
      height: DimensionHelper.headerHeight,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.bars, color: ColourHelper.white),
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
