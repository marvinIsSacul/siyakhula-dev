
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
      description: '''
      <h4>
      We assist primary and high school learners to improve their academic perfomance.
      We have proven strategies that provides good results to assist learners in gaining cofidence, improving their grades and finding joy in their studies.
      We have assisted learners to improve by an average of 20% through our intervention.
      </h4>

      <p>
        We specialise in the following subjects at affordable rates:
        <ul>
          <li>IsiXhosa</li>
          <li>English</li>
          <li>Life Orientation</li>
          <li>Mathematics</li>
          <li>Physical Sciences</li>
          <li>Accounting</li>
          <li>Business Studies</li>
        </ul>
      </p>
      ''',
      buttonText: "View available jobs",
      //buttonUrl: "https://www.netguru.com/career"
    ),

    _Service(
      image: PlatformHelper.isWeb() ? 'assets/img/bookkeeping-coaching.png' : 'assets/img/bookkeeping-coaching_phone.png',
      heading: 'Career Guidance',
      description: '''
      Most students face a challenge of not knowing which career path they should go for,
      we commit into providing consulting by unlocking unknown elements crucial for decision making to assist students in making rational decisions on which subjects to choose and which careers suits them.
      We assist students in understanding themselves to a point where they are confident about what they want to do post-matric.
      ''',
      buttonText: "View available jobs",
      //buttonUrl: "https://www.netguru.com/career"
    ),

    _Service(
      image: PlatformHelper.isWeb() ? 'assets/img/bookkeeping-coaching.png' : 'assets/img/bookkeeping-coaching_phone.png',
      heading: 'Personal Development',
      description: '''
      Young people find themselves in confusion due to life challenges and end up making uncalculated decisions which negatively affects them for the rest of their lives.
      We offer a platform of assisting young people in realizing their full potential by guiding them in making right choices and by offering effective tools necessary for their personal growth.
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
      child: SingleChildScrollView(
          child: Card( 
            elevation: 1.0,
            margin: EdgeInsets.zero,
            borderOnForeground: false,
            color: ColourHelper.blackTransparent1,
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
                Html(
                  data: service.description,
                  defaultTextStyle: TextStyleHelper.onPageDescription,
                  padding: EdgeInsets.symmetric(horizontal: DimensionHelper.spacingNormal),
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
        )
      )
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
