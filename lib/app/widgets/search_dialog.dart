import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/consts/theme_const.dart';
import '../core/localization/app_translate.dart';

class SearchDialog extends StatelessWidget {
  final String initialText;

  const SearchDialog(this.initialText);

  @override
  Widget build(BuildContext context) {
    const itemColor = Colors.white;

    return Stack(
      children: [
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: ThemeConst.roundedRectangleBorder,
          color: Theme.of(context).primaryColor,
          child: Container(
            height: 65,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(15, 19, 122, 1),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextFormField(
                style: const TextStyle(color: itemColor),
                initialValue: initialText,
                textInputAction: TextInputAction.search,
                autofocus: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppTranslate(context).text('search_dialog.hint'),
                    hintStyle: const TextStyle(color: itemColor),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: itemColor,
                    ),
                    suffixIcon: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        const ColoredBox(
                          color: itemColor,
                          child: SizedBox(
                            height: 30,
                            width: 1,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          color: itemColor,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    )),
                onFieldSubmitted: (text) {
                  Navigator.of(context).pop(text);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
