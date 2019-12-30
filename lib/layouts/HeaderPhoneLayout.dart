

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helpers/StyleHelper.dart';
import 'abstract/AbstractHeader.dart';


class HeaderPhoneLayout extends AbstractHeader implements PreferredSizeWidget {
  
  HeaderPhoneLayout(String pageTitle, void Function() onMenuPressed) : super(pageTitle, onMenuPressed);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      leading: IconButton(
        icon: Icon(FontAwesomeIcons.bars, color: ColourHelper.white),
        onPressed: this.onMenuPressed,
      ),
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
      title: Text(
        this.pageTitle,
        style: TextStyle(
          fontSize: 25.0,
          color: ColourHelper.white
        ),
      ),
      centerTitle: true,
      primary: true,

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
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 0.0);
}
