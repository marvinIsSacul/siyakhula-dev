
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'abstract/AbstractPage.dart';


class JoinOurTeamPage extends AbstractPage {

  JoinOurTeamPage() : super(pageTitle: 'Join Our Team', routeName: '/join-our-team', iconData: FontAwesomeIcons.users);


  Widget build(BuildContext context) {
    return this.basicScaffold(
      context,
      body: [
        
      ]
    );
  }
}
