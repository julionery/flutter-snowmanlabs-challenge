import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color color;

  const EmptyWidget({this.title = "", this.iconData, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
        ],
      ),
    );
  }
}
