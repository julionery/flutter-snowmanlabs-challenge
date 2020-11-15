import 'package:flutter/material.dart';

import '../core/localization/app_translate.dart';

class CustomAlertDialog extends StatelessWidget {
  final VoidCallback okPressed;

  const CustomAlertDialog({this.okPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        AppTranslate(context).text('app_buttons.delete').toUpperCase(),
        style: const TextStyle(color: Colors.red),
      ),
      content: Text(AppTranslate(context).text('app_messages.delete')),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            AppTranslate(context).text('app_buttons.cancel').toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        FlatButton(
          onPressed: okPressed,
          child: Text(
            AppTranslate(context).text('app_buttons.yes').toUpperCase(),
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
