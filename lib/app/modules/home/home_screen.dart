import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snowmanlabs_challenge/app/widgets/search_dialog.dart';

import '../../core/consts/theme_const.dart';
import '../../core/localization/app_translate.dart';
import '../../core/utils/app_converters.dart';
import '../../widgets/custom_raised_button.dart';
import 'components/question_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String search = "";

    return Scaffold(
      appBar: AppBar(
        shape: ThemeConst.roundedRectangleBorder,
        title: Text(
          AppTranslate(context).text('home.title'),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () async {
              await _showDialogSearch(context, search);
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 8),
        child: CustomRaisedButton(
          text: AppTranslate(context).text('home.add_button'),
          iconData: Icons.add,
          onPressed: () {},
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          itemCount: 30,
          itemBuilder: (_, index) {
            return QuestionTile(
              title: "Título da Pergunta",
              color: AppConverters.hexToFlutterColor(hexColor: "#ff0000"),
              answer:
                  "Mussum Ipsum, cacilds vidis litro abertis. Não sou faixa preta cumpadi, sou preto inteiris, inteiris. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis! Praesent malesuada urna nisi, quis volutpat erat hendrerit non. Nam vulputate dapibus. Vehicula non. Ut sed ex eros. Vivamus sit amet nibh non tellus tristique interdum.",
            );
          }),
    );
  }

  Future _showDialogSearch(BuildContext context, String valueSearch) async {
    final search = await showDialog<String>(
        context: context, builder: (_) => SearchDialog(valueSearch));
    if (search != null) {
      valueSearch = search;
    }
  }
}
