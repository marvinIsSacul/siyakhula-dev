import 'package:flutter/material.dart';


import '../config/Routes.dart';
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
              for (MenuItem item in Routes.primary())
                _createMenuItem(item, context),
            ],
          ),
          /*Container(
            height: DimensionHelper.menuHeight * 1,
          )*/
        ],
      )
    );
  }

  Widget _createMenuItem(MenuItem item, BuildContext context) {
    final bool isCurrentRoute = ModalRoute.of(context)?.settings?.name == item.routeName;

    return RaisedButton(
      color: isCurrentRoute ? ColourHelper.accentPrimary : ColourHelper.blackTransparent1,
      disabledColor: ColourHelper.accentPrimary,
      hoverColor: isCurrentRoute ? ColourHelper.accentPrimary : ColourHelper.black,
      padding: EdgeInsets.symmetric(horizontal: DimensionHelper.spacingNormal),
      child: Container(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8.0),
              child: Icon(
                item.iconData,
                color: ColourHelper.white
              ),
            ),
            Text(
              item.pageTitle,
              style: TextStyleHelper.menuLabel,
            )
          ]
        )
      ),
      onPressed: !item.isClikable || isCurrentRoute ? null : () {
        Navigator.popAndPushNamed(context, item.routeName);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))
    );

  }
}
