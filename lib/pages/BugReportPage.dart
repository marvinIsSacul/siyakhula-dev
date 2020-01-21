
//import 'dart:html';

import 'package:flutter/material.dart';

import '../helpers/UiHelper.dart';
import '../helpers/StyleHelper.dart';
import './abstract/AbstractPage.dart';


class BugReportPage extends AbstractPage {

  String _feedbackText = '';
  final _feedbackTextController = TextEditingController();
  final kRegistrationBlack = ColourHelper.blackTransparent1;


  @override
  Widget build(BuildContext context) {
    return this.basicScaffold(
      context,
      body: [this._buildLoginTextField(context), this._buildSubmitButton(context),],
      backgroundImage: 'assets/img/bug-background_md.jpg'
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return UiHelper.raisedButton(
      fillColour: ColourHelper.accentPrimary,
      splashColour: ColourHelper.accentPrimary,
      textColour: ColourHelper.white,
      onPressed: () {
        this._submitFeedback();
      },
      text: 'SUBMIT',
    );
  }

  Widget _buildScreenshotsField(BuildContext context) {
    return null;
    // return SingleChildScrollView(
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: this._screenshots.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       //return Container();
    //       return Card(
    //         child: Container(height: 256, width: 256, child: (this._screenshots.elementAt(0))),
    //       );
    //     },
    //   )
    // );
  }

  Widget _buildLoginTextField(BuildContext context) {
    return UiHelper.textInput(
      context: context,
      hint: 'Please describe the problem',
      hintColour: Colors.grey,
      textColour: ColourHelper.white,
      controller: this._feedbackTextController,
      maxLength: 14667,
      obsecure: false,
      minLines: 3,
      maxLines: 3
    );

  }

  void _submitFeedback() {

  }
}