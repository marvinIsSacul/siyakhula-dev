
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'abstract/AbstractPage.dart';


class FeesPage extends AbstractPage {

  FeesPage() : super(pageTitle: 'Fees', routeName: '/fees', iconData: FontAwesomeIcons.coins);


  Widget build(BuildContext context) {
    return this.basicScaffold(
      context,
      body: [
        
      ]
    );
  }
}
