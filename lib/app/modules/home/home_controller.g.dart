// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$friendsNumberAtom = Atom(name: '_HomeControllerBase.friendsNumber');

  @override
  double get friendsNumber {
    _$friendsNumberAtom.reportRead();
    return super.friendsNumber;
  }

  @override
  set friendsNumber(double value) {
    _$friendsNumberAtom.reportWrite(value, super.friendsNumber, () {
      super.friendsNumber = value;
    });
  }

  final _$totalAmountAtom = Atom(name: '_HomeControllerBase.totalAmount');

  @override
  double get totalAmount {
    _$totalAmountAtom.reportRead();
    return super.totalAmount;
  }

  @override
  set totalAmount(double value) {
    _$totalAmountAtom.reportWrite(value, super.totalAmount, () {
      super.totalAmount = value;
    });
  }

  final _$tipsAmountAtom = Atom(name: '_HomeControllerBase.tipsAmount');

  @override
  int get tipsAmount {
    _$tipsAmountAtom.reportRead();
    return super.tipsAmount;
  }

  @override
  set tipsAmount(int value) {
    _$tipsAmountAtom.reportWrite(value, super.tipsAmount, () {
      super.tipsAmount = value;
    });
  }

  final _$tipsAtom = Atom(name: '_HomeControllerBase.tips');

  @override
  double get tips {
    _$tipsAtom.reportRead();
    return super.tips;
  }

  @override
  set tips(double value) {
    _$tipsAtom.reportWrite(value, super.tips, () {
      super.tips = value;
    });
  }

  final _$billValueAtom = Atom(name: '_HomeControllerBase.billValue');

  @override
  double get billValue {
    _$billValueAtom.reportRead();
    return super.billValue;
  }

  @override
  set billValue(double value) {
    _$billValueAtom.reportWrite(value, super.billValue, () {
      super.billValue = value;
    });
  }

  final _$isResetPressedAtom = Atom(name: '_HomeControllerBase.isResetPressed');

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

  final _$selectedTipPercentageIndexAtom =
      Atom(name: '_HomeControllerBase.selectedTipPercentageIndex');

  @override
  int get selectedTipPercentageIndex {
    _$selectedTipPercentageIndexAtom.reportRead();
    return super.selectedTipPercentageIndex;
  }

  @override
  set selectedTipPercentageIndex(int value) {
    _$selectedTipPercentageIndexAtom
        .reportWrite(value, super.selectedTipPercentageIndex, () {
      super.selectedTipPercentageIndex = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setFriendsAmount(double value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setFriendsAmount');
    try {
      return super.setFriendsAmount(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedTipPercentageIndex(int value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setSelectedTipPercentageIndex');
    try {
      return super.setSelectedTipPercentageIndex(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTipsPercentage(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setTipsPercentage');
    try {
      return super.setTipsPercentage(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTipsValue() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setTipsValue');
    try {
      return super.setTipsValue();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBillValue(double value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setBillValue');
    try {
      return super.setBillValue(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTotalAmount() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setTotalAmount');
    try {
      return super.setTotalAmount();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.reset');
    try {
      return super.reset();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
friendsNumber: ${friendsNumber},
totalAmount: ${totalAmount},
tipsAmount: ${tipsAmount},
tips: ${tips},
billValue: ${billValue},
isResetPressed: ${isResetPressed},
selectedTipPercentageIndex: ${selectedTipPercentageIndex}
    ''';
  }
}
