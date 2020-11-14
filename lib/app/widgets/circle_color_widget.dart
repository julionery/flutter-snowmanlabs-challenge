import 'package:flutter/material.dart';

class CircleColorWidget extends StatelessWidget {
  final Color color;
  final bool selected;
  final GestureTapCallback onTap;

  const CircleColorWidget({this.color, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: const Color(0xFFf1f1f1),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFf2f2f2))),
          ),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          if (selected)
            const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ClipOval(
            child: Material(
              color: Colors.transparent, // button color
              child: InkWell(
                onTap: onTap,
                child: const SizedBox(width: 56, height: 56),
              ),
            ),
          )
        ],
      ),
    );
  }
}
