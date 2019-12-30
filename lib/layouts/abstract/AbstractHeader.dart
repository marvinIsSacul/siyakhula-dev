
import 'package:flutter/widgets.dart';


abstract class AbstractHeader extends StatelessWidget {
  final String pageTitle;
  final Function onMenuPressed;

  AbstractHeader(this.pageTitle, this.onMenuPressed);

  @override
  Widget build(BuildContext context);
}
