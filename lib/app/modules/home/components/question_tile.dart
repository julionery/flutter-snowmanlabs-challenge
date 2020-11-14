import 'package:flutter/material.dart';

class QuestionTile extends StatelessWidget {
  final String title;
  final String answer;
  final Color color;

  const QuestionTile({
    this.title,
    this.answer,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
            color: color,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
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
                  Text(
                    answer,
                    style: TextStyle(color: Colors.grey[600], fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
