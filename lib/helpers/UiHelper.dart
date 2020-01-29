
// Copyright (c) 2020, Marvin Kagiso
// All rights reserved.


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


/// Contains methods which help with User Interface creation.
abstract class UiHelper {

  /// Creates an input text with the given properties.
  static Widget textInput({
    @required BuildContext context,
    IconData icon,
    String hint = '',
    TextEditingController controller,
    Color hintColour,
    Color textColour,
    bool obsecure = false,
    int minLines = 1,
    int maxLines = 1,
    int maxLength,
    String errorText,
    TextInputType keyboardType = TextInputType.text,

    }) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        
        obscureText: obsecure,
        minLines: minLines,
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: 18, color: textColour ),
        decoration: InputDecoration(
          errorText: errorText,
          counterStyle: TextStyle(color: textColour),
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: hintColour),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3,
            ),
          ),
          prefixIcon: icon == null ? null : Padding(
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: Icon(icon),
            ),
            padding: EdgeInsets.only(left: 30, right: 10),
          )
        ),
      ),
    );
  }

  /// Creates a button with the given properties.
  static Widget raisedButton({@required String text, Color splashColour, Color highlightColour, Color fillColour, Color textColour, double elevation = 0.0, void onPressed()}) {
    return RaisedButton(
      highlightElevation: 0.0,
      splashColor: splashColour,
      highlightColor: highlightColour,
      elevation: 0.0,
      color: fillColour,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textColour,
          fontSize: 20
        ),
      ),
      onPressed: onPressed == null ? null : () {
        onPressed();
      },
    );
  }


  /// Creates and Displays a modal dialog with the given properties.
  static Future<bool> showDialogModal({@required BuildContext context, @required String title, @required String message}) {
    // flutter defined function
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
              child: Icon(FontAwesomeIcons.solidThumbsUp),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}