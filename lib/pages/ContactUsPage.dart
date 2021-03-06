
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/EnvironmentHelper.dart';
import '../helpers/PlatformHelper.dart';
import '../helpers/StyleHelper.dart';
import 'abstract/AbstractPage.dart';


class ContactUsPage extends AbstractPage {

  Widget build(BuildContext context) {
    return this.basicScaffold(
      context,
      body: [
        Container(height: DimensionHelper.spacingNormal),
        SelectableText(
          'Get In Touch',
          style: TextStyleHelper.onPageHeading,
          textAlign: TextAlign.center,
        ),
        Container(height: DimensionHelper.spacingLarge),
    
        Container(
          padding: EdgeInsets.symmetric(horizontal: DimensionHelper.spacingSmall),
          child: PlatformHelper.isLayoutMobile(context) ? this._forSmall(context) : this._forLarge(context)
        )  
      ]    
    );
  }

  Widget _forSmall(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _business(context),
        SizedBox(height: 20.0),
        _social(context),
      ]
    );
  }

  Widget _forLarge(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _business(context),
          _social(context),
        ]
      )
    );
  }

  Widget _detailsLine({String text, String url, IconData icon, BuildContext context}) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            icon,
            color: ColourHelper.white,
            size: 22.0,
          ),
          color: ColourHelper.white,
          onPressed: url == null ? null : () async {
            await launch(url);
          },
        ),
        //Container(margin: EdgeInsets.only(right: 8.0),),
        if (PlatformHelper.isLayoutMobile(context))
          Flexible(
            flex: 1,
            child: SelectableText(
              text,
              style: TextStyleHelper.onPageSectionDescription
            )
          )
        else
          SelectableText(
            text,
            style: TextStyleHelper.onPageSectionDescription
          )
      ],
    );
  }


  Widget _business(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          EnvironmentHelper.appNameShort() + ' OFFICE',
          style: TextStyleHelper.onPageSectionHeading,
        ),
        _detailsLine(
          context: context,
          text: EnvironmentHelper.addressPrimary(),
          icon: FontAwesomeIcons.mapMarkerAlt,
          url: 'https://www.google.co.za/maps/place/256+Cala+St,+Wedela,+2499/@-26.4590666,27.3805187,17z/data=!3m1!4b1!4m5!3m4!1s0x1e95cfc9ac25dea3:0x43f1a38f43f55911!8m2!3d-26.4590714!4d27.3827074'
        ),
        _detailsLine(
          context: context,
          text: EnvironmentHelper.emailSupport(),
          icon: FontAwesomeIcons.at,
          url: 'mailto:' + EnvironmentHelper.emailSupport()
        ),
        _detailsLine(
          context: context,
          text: EnvironmentHelper.phonePrimary(),
          icon: FontAwesomeIcons.phoneAlt,
          url: 'tel:+27' + EnvironmentHelper.phonePrimary().substring(1).replaceAll('-', '')
        ),
      ],
    );
  }

  Widget _social(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'SOCIAL CONNECTIONS',
          style: TextStyleHelper.onPageSectionHeading,
        ),
        _detailsLine(
          context: context,
          text: 'Facebook',
          url: EnvironmentHelper.appFacebookPageUrl(),
          icon: FontAwesomeIcons.facebook
        )
      ],
    );
  }
}
