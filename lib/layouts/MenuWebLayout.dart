import 'package:flutter/material.dart';


import './MenuItem.dart';
import '../helpers/StyleHelper.dart';


class MenuWebLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: DimensionHelper.menuHeight,
      padding: EdgeInsets.symmetric(
        vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.11
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          for (MenuItem item in MenuItem.all()) _normalMenuItem(item, context)
        ],
      ),
    );
  }

  Widget _normalMenuItem(MenuItem menuItem, BuildContext context) {
    return OutlineButton(
      padding: EdgeInsets.symmetric(horizontal: DimensionHelper.spacingNormal),
      child: Container(
      child: Row(
        children: [
          Icon(menuItem.icon),
          Text(
            menuItem.title,
            style: StyleHelper.button,
          )
        ]
      )
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => menuItem.toPage));
      },
      borderSide: BorderSide(color: ColourHelper.white, width: 3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))
    );

  }
}
