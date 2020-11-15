import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/localization/app_translate.dart';

class ActionsBottomSheet extends StatelessWidget {
  final VoidCallback update;
  final VoidCallback delete;

  const ActionsBottomSheet({this.update, this.delete});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {},
        enableDrag: false,
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FlatButton(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              onPressed: update,
              child: Text(
                AppTranslate(context).text('app_buttons.update'),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            FlatButton(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              onPressed: delete,
              child: Text(
                AppTranslate(context).text('app_buttons.delete'),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      );
    } else {
      return CupertinoActionSheet(
        title: Text(AppTranslate(context).text('bottom_sheet.title')),
        message: Text(AppTranslate(context).text('bottom_sheet.message')),
        cancelButton: CupertinoActionSheetAction(
          onPressed: Navigator.of(context).pop,
          child: Text(AppTranslate(context).text('app_buttons.cancel')),
        ),
        actions: [
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: update,
            child: Text(AppTranslate(context).text('app_buttons.update')),
          ),
          CupertinoActionSheetAction(
            onPressed: delete,
            child: Text(AppTranslate(context).text('app_buttons.delete')),
          )
        ],
      );
    }
  }
}
