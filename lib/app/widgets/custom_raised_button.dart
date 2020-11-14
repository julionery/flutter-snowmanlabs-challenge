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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
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
                    fontSize: 18),
              ),
            ),
            Icon(
              iconData,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
