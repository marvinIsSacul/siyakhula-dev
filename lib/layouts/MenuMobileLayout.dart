import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/EnvironmentHelper.dart';
import '../helpers/StyleHelper.dart';
import './MenuItem.dart';
import './LinkItem.dart';


class MenuMobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //elevation: 16.0,
      child: Container(
        decoration: BoxDecoration(
          color: ColourHelper.lightBlack,
         // borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.black,
              Colors.black54,
              Colors.black45,
              Colors.black38
            ]
          )
          //border: 
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            for (MenuItem item in MenuItem.primary())
              _createMenuItem(item, context),
            Divider(thickness: 1.0,),
            for (MenuItem item in MenuItem.secondary())
              _createMenuItem(item, context),
          ],
        ),
      ),
    );
  }

  Widget _createMenuItem(MenuItem item, BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              item.icon,
              color: ColourHelper.iconPrimary,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              item.title,
              style: TextStyle(color: ColourHelper.white)
            ),
          )
        ],
      ),
      onTap: (item.toPage == null) ? null : () {
        //Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => item.toPage));
      },
    );
}

   Widget _createHeader() {
    return Container(
        height: 64,
        padding: EdgeInsets.all(DimensionHelper.spacingSmall),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: ColourHelper.blackTransparent2
          //gradient: G (colors: [ColourHelper.blackTransparent1])
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/img/sda-logo_32.png'),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                EnvironmentHelper.appNameShort(),
                style: TextStyle(
                  color: ColourHelper.white,
                  fontSize: 26
                ),
              )
            ),
            /*Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
             // crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                for (LinkItem item in LinkItem.all())
                  IconButton(
                    icon: Icon(
                      item.icon,
                      color: ColourHelper.iconPrimary
                    ),
                    onPressed: () async {
                      await launch(item.url);
                    },
                  )
              ]
            )*/
          ],
        )
      );
    
  }
}
