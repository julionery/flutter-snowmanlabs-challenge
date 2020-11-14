import 'package:flutter/material.dart';

import '../core/localization/app_translate.dart';

class SearchWidget extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;

  const SearchWidget({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Text(
                    AppTranslate(context).text('search_widget.text'),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: onTap,
            visualDensity: VisualDensity.comfortable,
            color: Theme.of(context).buttonColor,
            textColor: Theme.of(context).primaryColor,
            height: 32,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.close,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
