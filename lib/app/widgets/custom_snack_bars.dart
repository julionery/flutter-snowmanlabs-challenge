import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  void snackBar(BuildContext context, String text,
      {Color color = Colors.black,
      IconData iconData,
      GlobalKey<ScaffoldState> scaffoldKey}) {
    final snackbar = SnackBar(
      backgroundColor: color,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (iconData != null) Icon(iconData),
          Expanded(
              child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ))
        ],
      ),
    );
    if (scaffoldKey != null) {
      scaffoldKey.currentState.showSnackBar(snackbar);
    } else {
      Scaffold.of(context).showSnackBar(snackbar);
    }
  }

  void flushBar(BuildContext context, String text,
      {Color color = Colors.black, IconData iconData}) {
    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.GROUNDED,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          Expanded(
              child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ))
        ],
      ),
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 24),
      backgroundColor: color,
      shouldIconPulse: false,
      duration: const Duration(milliseconds: 4000),
    ).show(context);
  }
}
