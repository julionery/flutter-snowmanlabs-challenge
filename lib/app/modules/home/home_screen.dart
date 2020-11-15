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
import '../../widgets/actions_bottom_sheet.dart';
import '../../widgets/custom_alert_dialog.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                await _showDialogSearch(context, controller.search);
              },
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 8),
          child: CustomRaisedButton(
            text: AppTranslate(context).text('home.add_button'),
            iconData: FontAwesome.plus,
            onPressed: () async {
              final response = await controller.goQuestion();
              if (response != null && response) {
                CustomSnackBar().flushBar(context,
                    AppTranslate(context).text('app_messages.success_added'),
                    color: ColorsConst.success, iconData: Icons.check_circle);
              }
            },
          ),
        ),
        body: Observer(builder: (context) {
          return Column(
            children: [
              if (controller.searchIsNotEmpty) ...[
                SearchWidget(
                  text: controller.search,
                  onTap: () => controller.search = "",
                )
              ],
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => controller.getList(),
                  child: Observer(builder: (_) {
                    if (controller.allQuestion == null ||
                        controller.allQuestion.hasError) {
                      return ListErrorWidget(
                        title: AppTranslate(context)
                            .text('app_messages.error_list'),
                        iconData: MaterialCommunityIcons.restart,
                        onPressed: controller.getList,
                      );
                    }

                    if (controller.allQuestion.data == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final List<QuestionModel> filteredList =
                        controller.filteredQuestions;

                    if (filteredList.isEmpty) {
                      return EmptyWidget(
                        title: AppTranslate(context)
                            .text('app_messages.records_not_found'),
                        iconData: Icons.list,
                      );
                    }

                    return ListView.builder(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 20,
                            top: controller.searchIsNotEmpty ? 8 : 20),
                        itemCount: filteredList.length,
                        itemBuilder: (_, index) {
                          final QuestionModel model = filteredList[index];
                          return QuestionTile(
                            title: model.title,
                            answer: model.answer,
                            hexColor: model.color,
                            onLongPress: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => ActionsBottomSheet(
                                        update: () async {
                                          Navigator.of(context).pop();
                                          final response = await controller
                                              .goQuestion(model);
                                          if (response != null && response) {
                                            CustomSnackBar().flushBar(
                                                _scaffoldKey.currentContext,
                                                AppTranslate(_scaffoldKey
                                                        .currentContext)
                                                    .text(
                                                        'app_messages.success_updated'),
                                                color: ColorsConst.update,
                                                iconData: Icons.edit);
                                          }
                                        },
                                        delete: () {
                                          _delete(context, model);
                                        },
                                      ));
                            },
                          );
                        });
                  }),
                ),
              ),
            ],
          );
        }));
  }

  Future _showDialogSearch(BuildContext context, String valueSearch) async {
    final search = await showDialog<String>(
        context: context, builder: (_) => SearchDialog(valueSearch));
    if (search != null) {
      controller.search = search;
    }
  }

  void _delete(BuildContext context, QuestionModel model) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          okPressed: () async {
            Navigator.of(context).pop();

            await controller.deleteQuestion(model).then((_) {
              Navigator.of(context).pop();
              CustomSnackBar().flushBar(
                  _scaffoldKey.currentContext,
                  AppTranslate(_scaffoldKey.currentContext)
                      .text('app_messages.success_deleted'),
                  color: ColorsConst.fail,
                  iconData: Icons.delete);
            }).catchError(
              (error) {
                CustomSnackBar().flushBar(
                    _scaffoldKey.currentContext, error.message as String,
                    color: Colors.red, iconData: Feather.alert_triangle);
              },
            );
          },
        );
      },
    );
  }
}
