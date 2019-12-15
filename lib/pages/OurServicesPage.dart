
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

import './AbstractPage.dart';
import '../helpers/StyleHelper.dart';
import '../helpers/PlatformHelper.dart';


class OurServicesPage extends AbstractPage {
  @protected final String pageTitle = 'Our Services';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: this.drawer(context),
      body: Builder(
        builder: (context) => Stack(
          children: <Widget>[
            PageIndicatorContainer(
              length: this._servicesCount,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.1
              ),
              indicatorSpace: DimensionHelper.spacingNormal,
              indicatorColor: ColourHelper.whiteTransparent1,
              indicatorSelectorColor: ColourHelper.white,
              child: PageView(
                children: [
                  _myService(
                    image: "assets/img/academic-coaching.png",
                    heading: "Academic Coaching",
                    description: '''Are you in Soweto, Johannesburg and surrounding areas? We can help you!''',
                    buttonText: "View available jobs",
                    //buttonUrl: "https://www.netguru.com/career"
                  ),
                  _myService(
                    image: "assets/img/bookkeeping-coaching.png",
                    heading: "Bookkeeping Coaching",
                    description: '''
                    To get you to a point where you are able to correctly record your business finances and reliably measure your financial performance from time to time.
                    ''',
                    buttonText: "View available jobs",
                    //buttonUrl: "https://www.netguru.com/career"
                  ),
                ]
              ),
            ),
            Column(
              children: <Widget>[
                this.headerAuto(context),
                if (!PlatformHelper.isWeb()
                  || PlatformHelper.isScreenExtraLarge(context)
                  || PlatformHelper.isScreenLarge(context)
                  || PlatformHelper.isScreenExtraLarge(context)
                  || PlatformHelper.isScreenMedium(context)
                  )
                  this.menuAuto(context),
              ],
            )
          ],
        ),
      ),
    );
  }


  final int _servicesCount = 2;

  Widget _myService({
      @required String heading,
      @required String description,
      @required String buttonText,
      @required String image,
    }) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: DimensionHelper.spacingNormal),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: ColourHelper.blackTransparent1,
        backgroundBlendMode: BlendMode.overlay,
        image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover
          )
        ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(height: DimensionHelper.spacingLarge),
          Text(
            heading,
            style: StyleHelper.subtitle,
            textAlign: TextAlign.center,
          ),
          Container(height: DimensionHelper.spacingLarge),
          Container(
            child: Text(
              description,
              style: StyleHelper.description,
              textAlign: TextAlign.center,
            )
          ),
          Container(height: DimensionHelper.spacingLarge),
          /*RaisedButton(
            padding: EdgeInsets.symmetric(
              vertical: DimensionHelper.spacingNormal,
              horizontal: DimensionHelper.spacingLarge
            ),
            child: Text(
              buttonText,
              style: StyleHelper.button,
            ),
            onPressed: () {

            },
            color: ColourHelper.accent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100))
            ),
          )*/
        ],
      ),
    );
  }
}
