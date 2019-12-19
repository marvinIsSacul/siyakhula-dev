
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_indicator/page_indicator.dart';


import './AbstractPage.dart';
import '../helpers/StyleHelper.dart';
import '../helpers/PlatformHelper.dart';


class AboutUsPage extends AbstractPage {

  AboutUsPage() : super() {
    super.routeName = '/about-us';
    super.pageTitle = 'About Us';
    super.iconData = FontAwesomeIcons.question;
  }


  static final List<String> _quotes = [
    '''
    We intend to improve lives of our clients by providing a distinct guidance to educational improvement and personal growth through our offerings.
    '''
  ];

  final List<_Section> _sections = [
    _Section(
      heading: "About Us",
      description: '''
        <p>Siyakhula Development Academy is a private company registered in 2017.
        We offer academic coaching, which is a combination of tutoring, support and guidance.
        We provide both customised group sessions and customized one-on one services suitable
        for our clients to learn and implement their learnings for improvement in their studies.
        </p>

        <p>
          <q>${_quotes[0]}></q>
        </p>
      '''
    ),

    _Section(
      heading: 'Our Aim',
      description: '''
      To create a positive learning platform for those who desire to learn and improve their areas of development by delivering excellent academic support and guidance in a very professional and exciting way.
      Our services are rendered by enthusiastic well-trained professionals with experience, passion, development-drive and commitment in different fields.
      Our organization has a group of multi-skilled, experienced and knowledgeable individuals with a common purpose of social impact and social growth.
      '''
    ),

    _Section(
      heading: 'Our Mission',
      description: '''
      To provide professional coaching which will develop upcoming leaders with relevant skills and knowledge in order to
      consistently remain competent in the challenging global market.
      '''
    ),

    _Section(
      heading: 'Our Vision',
      description: '''
      To be one of the top coaching providers within our niche characterised by offering quality services,
      creating an excellent environment for our clients to learn, execute and grow,
      to satisfy our clients and have an impact in their lives through our supportive system.
      '''
    ),

    _Section(
      heading: 'Our Values',
      description: '''
      <p>
        The following values inform how we operate:
      </p>
      <ol>
        <li>
          <b>Time conscious:</b> be aware of the value of time and therefore, always be punctual in serving our clients and in all other things we do.
        </li>

        <li>
          <b>Respect:</b> constantly and consistently considerate of all the stakeholders’ interests in all our dealings.
        </li>

        <li>
          <b>Commitment and Hard-work:</b> we pledge ourselves to provide quality services through dedication and enthusiastically finish all the tasks at hand timeously.
        </li>

        <li>
          <b>Effective Communication:</b> Ensuring that all exchange of information is done in an appropriate manner so as to promoting a smooth flow of communication in all relevant parties.
        </li>

        <li>
          <b>Customer-cenrtric:</b> we provide a positive customer experience and we value all our customers.
        </li>
      </ol>
      '''
    ),    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: this.drawer(context),
      body: Builder(
        builder: (context) => Stack(
          children: <Widget>[
            PageIndicatorContainer(
              length: this._sections.length,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.1
              ),
              indicatorSpace: DimensionHelper.spacingNormal,
              indicatorColor: ColourHelper.white,
              indicatorSelectorColor: ColourHelper.accentPrimary,
              child: PageView(
                children: [
                  for (_Section section in this._sections)
                    _myService(section, context),
                ]
              ),
            ),
            Column(
              children: <Widget>[
                this.headerAuto(context),
                if (PlatformHelper.isLayoutDesktop(context)) this.menuAuto(context),
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget _myService(_Section service, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: DimensionHelper.spacingNormal),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: ColourHelper.blackTransparent1,
        backgroundBlendMode: BlendMode.overlay,
        image: DecorationImage(
          image: AssetImage(
            PlatformHelper.isLayoutMobile(context) ? 'assets/img/default-background-2_md.jpg' : 'assets/img/default-background-2_lg.jpg'
          ),
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
                Container(height: DimensionHelper.spacingNormal),
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
                Container(height: DimensionHelper.spacingNormal),
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


class _Section {
  String image;
  String heading;
  String description; 

  _Section({this.image, this.heading, this.description});
}
