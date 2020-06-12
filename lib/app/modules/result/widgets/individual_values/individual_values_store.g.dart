// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_values_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IndividualValuesStore on _IndividualValuesStoreBase, Store {
  final _$individualValuesAtom =
      Atom(name: '_IndividualValuesStoreBase.individualValues');

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

  final _$_IndividualValuesStoreBaseActionController =
      ActionController(name: '_IndividualValuesStoreBase');

  @override
  void recalculateIndividualValues(int index) {
    final _$actionInfo =
        _$_IndividualValuesStoreBaseActionController.startAction(
            name: '_IndividualValuesStoreBase.recalculateIndividualValues');
    try {
      return super.recalculateIndividualValues(index);
    } finally {
      _$_IndividualValuesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_IndividualValuesStoreBaseActionController
        .startAction(name: '_IndividualValuesStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$_IndividualValuesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
individualValues: ${individualValues}
    ''';
  }
}
