import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/consts/colors_const.dart';
import '../../core/consts/theme_const.dart';
import '../../core/localization/app_translate.dart';
import '../../core/utils/app_converters.dart';
import '../../modules/home/home_controller.dart';
import '../../widgets/custom_raised_button.dart';
import '../../widgets/custom_snack_bars.dart';
import '../../widgets/search_dialog.dart';

import 'components/question_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ModularState<HomeScreen, HomeController> {
  @override
  Widget build(BuildContext context) {
    const String search = "";
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        shape: ThemeConst.roundedRectangleBorder,
        title: Text(
          AppTranslate(context).text('home.title'),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              AntDesign.search1,
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
          iconData: FontAwesome.plus,
          onPressed: () async {
            final result = await controller.doAddQuestion();
            if (result != null && result) {
              CustomSnackBar().flushBar(
                  context, "Pergunta adicionada com sucesso",
                  color: ColorsConst.success, iconData: Icons.check_circle);
            }
          },
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
