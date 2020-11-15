// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuestionController on _QuestionController, Store {
  final _$loadingAtom = Atom(name: '_QuestionController.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$isEditingAtom = Atom(name: '_QuestionController.isEditing');

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  final _$modelAtom = Atom(name: '_QuestionController.model');

  @override
  QuestionModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(QuestionModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$selectedColorAtom = Atom(name: '_QuestionController.selectedColor');

  @override
  String get selectedColor {
    _$selectedColorAtom.reportRead();
    return super.selectedColor;
  }

  @override
  set selectedColor(String value) {
    _$selectedColorAtom.reportWrite(value, super.selectedColor, () {
      super.selectedColor = value;
    });
  }

  @override
  String toString() {
    return '''
loading: ${loading},
isEditing: ${isEditing},
model: ${model},
selectedColor: ${selectedColor}
    ''';
  }
}
