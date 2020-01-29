
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import '../helpers/UiHelper.dart';
import '../helpers/PlatformHelper.dart';
import '../helpers/StyleHelper.dart';
import 'abstract/AbstractPage.dart';


class JoinOurTeamPage extends AbstractPage {

  final _firstNameCtrl = TextEditingController();
  final _surnameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  void dispose() {
    _phoneCtrl.dispose();
    _firstNameCtrl.dispose();
    _emailCtrl.dispose();
    _surnameCtrl.dispose();
  }

  Widget _buildFirstName(BuildContext context) {
    return Container(
        child: UiHelper.textInput(
          context: context,
          controller: _firstNameCtrl,
          maxLength: 32,
          hintColour: Colors.grey,
          textColour: ColourHelper.white,
          hint: 'First Name'
        )
    );
  }

  Widget _buildSurname(BuildContext context) {
    return Container(
      child: UiHelper.textInput(
        context: context,
        maxLength: 32,
        controller: _surnameCtrl,
        hintColour: Colors.grey,
        textColour: ColourHelper.white,
        hint: 'Surname',
      )
    );
  }

  Widget _buildEmail(BuildContext context) {
    return Container(
      child: UiHelper.textInput(
        context: context,
        maxLength: 100,
        controller: _emailCtrl,
        hintColour: Colors.grey,
        textColour: ColourHelper.white,
        hint: 'Email',
        keyboardType: TextInputType.emailAddress
      )
    );
  }

  Widget _buildPhone(BuildContext context) {
    return Container(
      child: UiHelper.textInput(
        context: context,
        maxLength: 12,
        controller: _phoneCtrl,
        hintColour: Colors.grey,
        textColour: ColourHelper.white,
        hint: 'Phone Number',
        keyboardType: TextInputType.number
      )
    );
  }

  Widget _buildSubmit(BuildContext context, bool isLarge) {
    if (!isLarge) {
      return FloatingActionButton(
        child: Text('Join'),
        onPressed: (){},
        splashColor: ColourHelper.accentTertiary,
      );
    }
    else {
      return UiHelper.raisedButton(
        text: 'Submit',
        fillColour: ColourHelper.accentPrimary,
        textColour: ColourHelper.white,
        splashColour: ColourHelper.accentTertiary,
        onPressed: this._submitDetails
      );
    }
  }

  Widget build(BuildContext context) {
    final isLargeScreen = PlatformHelper.isScreenLarge(context) || PlatformHelper.isScreenExtraLarge(context);
    final size = MediaQuery.of(context).size;

    return this.basicScaffold(
      context,
      body: [
        Container(
          width: isLargeScreen ? size.width * 0.50 : null,
          child: Form(
            autovalidate: true,
            onChanged: () {
              
            },
            child: Column(
              children: <Widget>[
                _buildFirstName(context),
                SizedBox(height: 20),
                _buildSurname(context),
                SizedBox(height: 20,),
                _buildEmail(context),
                SizedBox(height: 20),
                _buildPhone(context),

                if (isLargeScreen) _buildSubmit(context, true),
                if (isLargeScreen) SizedBox(height: 20,),
              ],
            )
          ),
        )
      ],
      floatingActionButton: isLargeScreen ? null : _buildSubmit(context, false)
    );
  }

  void _submitDetails() {

  }
}
