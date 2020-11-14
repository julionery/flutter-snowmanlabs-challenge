import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../core/consts/colors_const.dart';
import '../core/consts/theme_const.dart';
import '../core/localization/app_translate.dart';

class SearchDialog extends StatelessWidget {
  final String initialText;

  const SearchDialog(this.initialText);

  @override
  Widget build(BuildContext context) {
    const itemColor = Colors.white70;

    final TextEditingController textController = TextEditingController();
    textController.text = initialText;

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
              decoration: BoxDecoration(
                  color: ColorsConst().backgroundMainColor(1),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: TextFormField(
                controller: textController,
                style: const TextStyle(color: Colors.white),
                textInputAction: TextInputAction.search,
                autofocus: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppTranslate(context).text('search_dialog.hint'),
                    hintStyle: const TextStyle(color: itemColor),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    prefixIcon: const Icon(
                      AntDesign.search1,
                      color: itemColor,
                    ),
                    suffixIcon: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        const ColoredBox(
                          color: Colors.white38,
                          child: SizedBox(
                            height: 25,
                            width: 1.5,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(AntDesign.close),
                          color: itemColor,
                          onPressed: () {
                            if (textController.text.isNotEmpty) {
                              textController.clear();
                            } else {
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ],
                    )),
                onFieldSubmitted: (text) {
                  Navigator.of(context).pop(text.trim());
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
