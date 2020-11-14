// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  Computed<bool> _$searchIsNotEmptyComputed;

  @override
  bool get searchIsNotEmpty => (_$searchIsNotEmptyComputed ??= Computed<bool>(
          () => super.searchIsNotEmpty,
          name: '_HomeController.searchIsNotEmpty'))
      .value;

  final _$loadingAtom = Atom(name: '_HomeController.loading');

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

  final _$searchAtom = Atom(name: '_HomeController.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  @override
  String toString() {
    return '''
loading: ${loading},
search: ${search},
searchIsNotEmpty: ${searchIsNotEmpty}
    ''';
  }
}
