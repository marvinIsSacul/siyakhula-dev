
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/StyleHelper.dart';
import '../helpers/EnvironmentHelper.dart';
import '../config/Links.dart';

import 'abstract/AbstractHeader.dart';


class HeaderWebLayout extends AbstractHeader implements PreferredSizeWidget  {

  HeaderWebLayout([String pageTitle, Function onMenuPressed]) : super(pageTitle, onMenuPressed);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      brightness: Brightness.light,
      flexibleSpace: Container(
        decoration: BoxDecoration(
         // borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              ColourHelper.accentPrimary,
              ColourHelper.accentSecondary,
              ColourHelper.accentTertiary,
              ColourHelper.accentLast,
            ]
          )
          //border: 
        ),
      ),
      title: Row(
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
              color: ColourHelper.white
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                for (Links link in Links.all()) _drawLinkItem(link)
              ],
            ),
          ),
        ],
      ),
      centerTitle: false,
      primary: true,
      leading: Container(), // prevent default back icon to be inserted.

      // decoration: BoxDecoration(color: ColourHelper.blackTransparent2),
      // margin: EdgeInsets.only(bottom: DimensionHelper.spacingNormal),
      // height: DimensionHelper.headerHeight,
      // child: Row(
      //   children: <Widget>[
      //     IconButton(
      //       icon: Icon(FontAwesomeIcons.bars, color: ColourHelper.white),
      //       onPressed: this.onMenuPressed,
      //     ),
      //     Text(
      //       this.pageTitle,
      //       style: TextStyle(
      //         fontSize: 25.0,
      //         color: Color.fromRGBO(255, 255, 255, 1.0)
      //       ),
      //     )
      //   ]
      // )
    );

    return Container(
      height: DimensionHelper.headerHeight,
      decoration: BoxDecoration(color: ColourHelper.accentPrimary),
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
              color: ColourHelper.white
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                for (Links link in Links.all()) _drawLinkItem(link)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawLinkItem(Links linkItem) => Container(
    padding: EdgeInsets.symmetric(
      vertical: DimensionHelper.spacingNormal,
      horizontal: DimensionHelper.spacingSmall
    ),
    child: GestureDetector(
      onTap: () async {
        await launch(linkItem.url);
      },
      /*onDoubleTap: () async {

      },*/
      child: Icon(
        linkItem.icon,
        color: ColourHelper.iconPrimary
      ),
    )
  );

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 0.0);
}
