import 'package:flutter/material.dart';

import '../core/localization/app_translate.dart';

class ListErrorWidget extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color color;
  final VoidCallback onPressed;

  const ListErrorWidget(
      {this.title = "", this.iconData, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (iconData != null)
              Icon(
                iconData,
                size: 80.0,
                color: color ?? Theme.of(context).primaryColor,
              ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: color ?? Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            RaisedButton(
              onPressed: onPressed,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Text(
                AppTranslate(context).text('app_buttons.reload'),
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
