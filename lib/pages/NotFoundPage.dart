
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'abstract/AbstractPage.dart';


class NotFoundPage extends AbstractPage {

  NotFoundPage() : super(routeName: '/404', pageTitle: '404', iconData: FontAwesomeIcons.info);

  Widget build(BuildContext context) {
    return this.basicScaffold(context, 
      body: [
        Container(
          
        )
    ]);
  }
}
