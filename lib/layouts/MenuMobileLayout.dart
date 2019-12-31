import 'package:flutter/material.dart';

import '../helpers/EnvironmentHelper.dart';
import '../helpers/StyleHelper.dart';
import '../config/Routes.dart';


class MenuMobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //elevation: 16.0,
      child: Container(
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
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            for (MenuItem item in Routes.primary())
              _createMenuItem(item, context),
            if (Routes.secondary().length > 0)
              Divider(thickness: 1.0,),
            for (MenuItem item in Routes.secondary())
              _createMenuItem(item, context),
          ],
        ),
      ),
      
    );
  }

  Widget _createMenuItem(MenuItem item, BuildContext context) {
    final bool isCurrentRoute = ModalRoute.of(context)?.settings?.name == item.routeName;

    return ListTile(
      leading: Icon(
        item.iconData,
        color: isCurrentRoute ? ColourHelper.black : ColourHelper.iconPrimary,
      ),
      selected: isCurrentRoute,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
         Text(
            item.pageTitle,
            style: TextStyle(
              color: isCurrentRoute ? ColourHelper.black : ColourHelper.white
            )
          ),
        ],
      ),
      onTap: !item.isClikable || isCurrentRoute ? null : () {
        Navigator.popAndPushNamed(context, item.routeName);
      },
    );
  }

   Widget _createHeader() {
    return Container(
        height: 64,
        padding: EdgeInsets.all(DimensionHelper.spacingSmall),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
          color: ColourHelper.blackTransparent2
          //gradient: G (colors: [ColourHelper.blackTransparent1])
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/img/sda-logo_32.png'),
              //radius: 16.0,
              minRadius: 18.0,
              maxRadius: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                EnvironmentHelper.appNameShort(),
                style: TextStyle(
                  color: ColourHelper.white,
                  fontSize: 24
                ),
              )
            )
          ],
        )
      );
    
  }
}
