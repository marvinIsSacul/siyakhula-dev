
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

import './AbstractPage.dart';
import '../helpers/StyleHelper.dart';
import '../helpers/PlatformHelper.dart';


class OurServicesPage extends AbstractPage {
  @protected final String pageTitle = 'Our Services';

  final List<_Service> _services = [
    _Service(
      image: "assets/img/academic-coaching.png",
      heading: "Academic Coaching",
      description: '''Are you in Soweto, Johannesburg and surrounding areas? We can help you!''',
      buttonText: "View available jobs",
      //buttonUrl: "https://www.netguru.com/career"
    ),

    _Service(
      image: PlatformHelper.isWeb() ? 'assets/img/bookkeeping-coaching.png' : 'assets/img/bookkeeping-coaching_phone.png',
      heading: "Bookkeeping Coaching",
      description: '''
      To get you to a point where you are able to correctly record your business finances and reliably measure your financial performance from time to time.
      ''',
      buttonText: "View available jobs",
      //buttonUrl: "https://www.netguru.com/career"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: this.drawer(context),
      body: Builder(
        builder: (context) => Stack(
          children: <Widget>[
            PageIndicatorContainer(
              length: this._services.length,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.1
              ),
              indicatorSpace: DimensionHelper.spacingNormal,
              indicatorColor: ColourHelper.whiteTransparent1,
              indicatorSelectorColor: ColourHelper.white,
              child: PageView(
                children: [
                  for (_Service service in this._services)
                    _myService(service),
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
                  //|| PlatformHelper.isScreenMedium(context)
                  )
                  this.menuAuto(context),
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget _myService(_Service service) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: DimensionHelper.spacingNormal),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: ColourHelper.blackTransparent1,
        backgroundBlendMode: BlendMode.overlay,
        image: DecorationImage(
          image: AssetImage(service.image),
          fit: BoxFit.cover
        )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(height: DimensionHelper.spacingLarge),
          SelectableText(
            service.heading,
            style: TextStyleHelper.onPageHeading,
            textAlign: TextAlign.center,
          ),
          Container(height: DimensionHelper.spacingLarge),
          Container(
            child: SelectableText(
              service.description,
              style: TextStyleHelper.onPageDescription,
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


class _Service {
  String image;
  String heading;
  String description; 
  String buttonText;

  _Service({this.image, this.heading, this.description, this.buttonText});
}
