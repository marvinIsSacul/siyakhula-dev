import 'package:flutter/material.dart';


import './MenuItem.dart';
import '../helpers/StyleHelper.dart';


class MenuWebLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: ColourHelper.blackTransparent1,
      height: DimensionHelper.menuHeight,
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: MediaQuery.of(context).size.width * 0.11
      ),
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              for (MenuItem item in MenuItem.primary()) _createMenuItem(item, context),
            ],
          ),
          /*Container(
            height: DimensionHelper.menuHeight * 1,
          )*/
        ],
      )
    );
  }

  Widget _createMenuItem(MenuItem menuItem, BuildContext context) {
    return OutlineButton(
      padding: EdgeInsets.symmetric(horizontal: DimensionHelper.spacingNormal),
      child: Container(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8.0),
              child: Icon(
                menuItem.icon,
                color: ColourHelper.iconPrimary
              ),
            ),
            Text(
              menuItem.title,
              style: TextStyleHelper.button,
            )
          ]
        )
      ),
      onPressed: menuItem.toPage == null ? null : () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => menuItem.toPage));
      },
      borderSide: BorderSide(color: ColourHelper.white, width: 3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))
    );

  }
}
