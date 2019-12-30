
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../helpers/StyleHelper.dart';
import 'abstract/AbstractPage.dart';


class NotFoundPage extends AbstractPage {

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
          
        )
    ]);
  }
}
