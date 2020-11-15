import 'package:flutter/material.dart';

import '../../../core/utils/app_converters.dart';

class QuestionTile extends StatelessWidget {
  final String title;
  final String answer;
  final String hexColor;
  final GestureLongPressCallback onLongPress;

  const QuestionTile({
    this.title,
    this.answer,
    this.hexColor,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppConverters.hexToFlutterColor(hexColor: hexColor),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
              ),
              margin: const EdgeInsets.only(left: 3),
              child: Theme(
                data: ThemeData(accentColor: Colors.grey),
                child: ExpansionTile(
                  title: Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                  childrenPadding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        answer,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.grey[600], fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
