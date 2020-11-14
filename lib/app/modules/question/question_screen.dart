import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/consts/colors_const.dart';
import '../../core/consts/theme_const.dart';
import '../../core/localization/app_translate.dart';
import '../../core/utils/app_converters.dart';
import '../../widgets/circle_color_widget.dart';
import '../../widgets/custom_snack_bars.dart';
import '../../widgets/custom_text_form_field.dart';
import 'question_controller.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState
    extends ModularState<QuestionScreen, QuestionController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: ThemeConst.roundedRectangleBorder,
        title: Text(
          AppTranslate(context).text('question.title'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Form(
            key: formKey,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          label:
                              AppTranslate(context).text('question.form_title'),
                          onChanged: (value) => controller.title = value,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                          label: AppTranslate(context)
                              .text('question.form_answer'),
                          maxLines: 4,
                          onChanged: (value) => controller.answer = value,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                          children: [
                            Text(
                                AppTranslate(context)
                                    .text('question.form_color'),
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(
                              height: 8,
                            ),
                            Observer(builder: (context) {
                              return SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _buildCircleColorWidgets(),
                                ),
                              );
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Observer(builder: (context) {
                        return RaisedButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              await controller.save().catchError(
                                (error) {
                                  CustomSnackBar().snackBar(
                                      context,
                                      AppTranslate(context)
                                          .text('app_messages.fail'),
                                      iconData: AntDesign.closecircle,
                                      color: ColorsConst.fail);
                                },
                              );
                              Navigator.of(context).pop(true);
                            }
                          },
                          child: controller.loading
                              ? const SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator())
                              : Text(
                                  AppTranslate(context)
                                      .text('question.add_button'),
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCircleColorWidgets() {
    final List<Widget> items = [];
    for (final hexColor in ColorsConst.arrayColorsQuestion) {
      items.add(CircleColorWidget(
        color: AppConverters.hexToFlutterColor(hexColor: hexColor),
        selected: controller.color == hexColor,
        onTap: () => controller.color = hexColor,
      ));
    }
    return items;
  }
}
