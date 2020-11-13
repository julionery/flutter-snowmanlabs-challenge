import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function() onPressed;

  const CustomRaisedButton({this.text, this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: RaisedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Icon(
              iconData,
              size: 30,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
