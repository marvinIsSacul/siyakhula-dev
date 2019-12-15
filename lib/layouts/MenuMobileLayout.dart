import 'package:flutter/material.dart';

import './MenuItem.dart';


class MenuMobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //elevation: 16.0,
      child: ListView(
       // padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          for (MenuItem item in MenuItem.all())
            _createMenuItem(item, context),
          Divider(),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createMenuItem(MenuItem item, BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(item.icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(item.title),
          )
        ],
      ),
      onTap: () {
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
        child: Stack(children: <Widget>[
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text(
              "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500
              )
            )
          ),
        ]
      )
    );
  }
}
