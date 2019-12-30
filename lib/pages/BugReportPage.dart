
//import 'dart:html';

import 'package:flutter/material.dart';

import '../helpers/PlatformHelper.dart';
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
    return Column(
      children: <Widget>[
        Container(height: DimensionHelper.spacingNormal),
        RaisedButton(
          padding: EdgeInsets.symmetric(
            vertical: DimensionHelper.spacingNormal,
            horizontal: DimensionHelper.spacingLarge
          ),
          child: Text(
            'Submit',
            style: TextStyleHelper.buttonDefault,
          ),
          onPressed: () async {
            this._submitFeedback();
          },
          color: ColourHelper.accentPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))
          ),
        )
      ],
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
    return Container(
      padding: EdgeInsets.all(DimensionHelper.spacingNormal), 
      child: Column(
        children: <Widget>[
          TextFormField(
            style: TextStyle(
              color: ColourHelper.white
            ),
            controller: this._feedbackTextController,
            maxLength: 16000,
            enableInteractiveSelection: false,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.next,
            maxLines: 5,
            minLines: 4,
            onFieldSubmitted: (String text) {
              // this._submitFeedback();
            },
            decoration: InputDecoration(
              fillColor: ColourHelper.white,
              counterStyle: TextStyle(
                color: ColourHelper.white
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              focusColor: ColourHelper.white,
              hoverColor: ColourHelper.white,
              contentPadding: EdgeInsets.all(DimensionHelper.spacingNormal),
              labelText: 'Please describe the problem...',
              labelStyle: TextStyle(
                color: ColourHelper.white,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: ColourHelper.white,
                ),
                onPressed: () {
                  this._feedbackTextController.clear();
                  this._feedbackText = '';
                },
              ),
            ),
            validator: (String text) {
              return text.trim().length < 10 ? null : '';
            },
            onSaved: (String value) {
              this._feedbackText = value.trim();
            },
          )
        ]
      )
    );
  }

  void _submitFeedback() {

  }
}