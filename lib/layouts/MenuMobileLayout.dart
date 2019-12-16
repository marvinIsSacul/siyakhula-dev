import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          color: ColourHelper.blackTransparent1,
          backgroundBlendMode: BlendMode.darken,
          //border: 
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            for (MenuItem item in MenuItem.primary())
              _createMenuItem(item, context),
            Divider(),
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
            child: Icon(item.icon),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(item.title),
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
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image:  AssetImage('assets/img/sda-logo.png')
        )
      ),
      child: Container(
        padding: EdgeInsets.all(DimensionHelper.spacingSmall),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            for (LinkItem linkItem in LinkItem.all()) 
              IconButton(
                icon: Icon(
                  linkItem.icon,
                  color: ColourHelper.black,
                ),
                onPressed: () async {
                  await launch(linkItem.url);
                },
              ),
          ],
        )
      )
    );
  }
}
