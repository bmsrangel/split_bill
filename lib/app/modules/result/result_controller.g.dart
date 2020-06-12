// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResultController on _ResultControllerBase, Store {
  final _$splittedValueAtom = Atom(name: '_ResultControllerBase.splittedValue');

  @override
  int get splittedValue {
    _$splittedValueAtom.reportRead();
    return super.splittedValue;
  }

  @override
  set splittedValue(int value) {
    _$splittedValueAtom.reportWrite(value, super.splittedValue, () {
      super.splittedValue = value;
    });
  }

  final _$individualValuesAtom =
      Atom(name: '_ResultControllerBase.individualValues');

  @override
  List<int> get individualValues {
    _$individualValuesAtom.reportRead();
    return super.individualValues;
  }

  @override
  set individualValues(List<int> value) {
    _$individualValuesAtom.reportWrite(value, super.individualValues, () {
      super.individualValues = value;
    });
  }

  final _$isResetPressedAtom =
      Atom(name: '_ResultControllerBase.isResetPressed');

  @override
  bool get isResetPressed {
    _$isResetPressedAtom.reportRead();
    return super.isResetPressed;
  }

  @override
  set isResetPressed(bool value) {
    _$isResetPressedAtom.reportWrite(value, super.isResetPressed, () {
      super.isResetPressed = value;
    });
  }

  final _$_ResultControllerBaseActionController =
      ActionController(name: '_ResultControllerBase');

  @override
  void setSplittedValue() {
    final _$actionInfo = _$_ResultControllerBaseActionController.startAction(
        name: '_ResultControllerBase.setSplittedValue');
    try {
      return super.setSplittedValue();
    } finally {
      _$_ResultControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndividualValues(List<int> value) {
    final _$actionInfo = _$_ResultControllerBaseActionController.startAction(
        name: '_ResultControllerBase.setIndividualValues');
    try {
      return super.setIndividualValues(value);
    } finally {
      _$_ResultControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_ResultControllerBaseActionController.startAction(
        name: '_ResultControllerBase.reset');
    try {
      return super.reset();
    } finally {
      _$_ResultControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
splittedValue: ${splittedValue},
individualValues: ${individualValues},
isResetPressed: ${isResetPressed}
    ''';
  }
}
