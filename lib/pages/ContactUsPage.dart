
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
          child: PlatformHelper.isLayoutMobile(context) ? this._forSmall() : this._forLarge()
        )  
      ]    
    );
  }

  Widget _forSmall() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _business(),
        _social(),
      ]
    );
  }

  Widget _forLarge() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _business(),
        _social(),
      ]
    );
  }

  Widget _detailsLine({String text, String url, IconData icon}) {
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
        SelectableText(
          text,
          style: TextStyleHelper.onPageSectionDescription
        )
      ],
    );
  }


  Widget _business() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          EnvironmentHelper.appNameShort() + ' OFFICE',
          style: TextStyleHelper.onPageSectionHeading,
        ),
        _detailsLine(text: EnvironmentHelper.addressPrimary(), icon: FontAwesomeIcons.mapMarkerAlt),
        _detailsLine(text: EnvironmentHelper.emailSupport(), icon: FontAwesomeIcons.at),
        _detailsLine(
          text: EnvironmentHelper.phonePrimary(),
          icon: FontAwesomeIcons.phoneAlt,
          url: 'tel:+27' + EnvironmentHelper.phonePrimary().substring(1).replaceAll('-', '')
        ),
      ],
    );
  }

  Widget _social() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'SOCIAL CONNECTiONS',
          style: TextStyleHelper.onPageSectionHeading,
        ),
        _detailsLine(text: 'Facebook', url: EnvironmentHelper.appFacebookPageUrl(), icon: FontAwesomeIcons.facebook)
      ],
    );
  }
}
