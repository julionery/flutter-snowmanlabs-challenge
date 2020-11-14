import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/consts/colors_const.dart';
import '../../core/consts/theme_const.dart';
import '../../core/localization/app_translate.dart';
import '../../models/question_model.dart';
import '../../modules/home/home_controller.dart';
import '../../widgets/custom_raised_button.dart';
import '../../widgets/custom_snack_bars.dart';
import '../../widgets/empty_widget.dart';
import '../../widgets/list_error_widget.dart';
import '../../widgets/search_dialog.dart';
import '../../widgets/search_widget.dart';
import 'components/question_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ModularState<HomeScreen, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              await _showDialogSearch(context, controller.search);
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
                  context, AppTranslate(context).text('app_messages.success'),
                  color: ColorsConst.success, iconData: Icons.check_circle);
            }
          },
        ),
      ),
      body: Observer(builder: (_) {
        if (controller.questionList.hasError) {
          return ListErrorWidget(
            title: AppTranslate(context).text('app_messages.error_list'),
            iconData: MaterialCommunityIcons.restart,
            onPressed: controller.getList,
          );
        }

        if (controller.questionList.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<QuestionModel> list =
            controller.questionList.data as List<QuestionModel>;

        if (list.isEmpty) {
          return EmptyWidget(
            title: AppTranslate(context).text('app_messages.records_not_found'),
            iconData: Icons.list,
          );
        }

        return Column(
          children: [
            if (controller.searchIsNotEmpty) ...[
              SearchWidget(
                text: controller.search,
                onTap: () => controller.search = "",
              )
            ],
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 20,
                      top: controller.searchIsNotEmpty ? 8 : 20),
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    final QuestionModel model = list[index];
                    return QuestionTile(
                      title: model.title,
                      answer: model.answer,
                      hexColor: model.color,
                    );
                  }),
            ),
          ],
        );
      }),
    );
  }

  Future _showDialogSearch(BuildContext context, String valueSearch) async {
    final search = await showDialog<String>(
        context: context, builder: (_) => SearchDialog(valueSearch));
    debugPrint(search);
    if (search != null) {
      controller.search = search;
    }
  }
}
