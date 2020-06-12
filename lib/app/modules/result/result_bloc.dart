import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

import '../../shared/models/card_info_model.dart';

class ResultBloc extends Disposable {
  final CardInfoModel cardInfo;

  ResultBloc(this.cardInfo) {
    this.setSplittedValue();
    List<int> temp = List<int>.generate(
        this.cardInfo.friendsAmount == 0 ? 1 : this.cardInfo.friendsAmount,
        (index) => this.splittedValue$.value.round());
    this.setIndividualValues(temp);
  }

  BehaviorSubject<double> splittedValue$ = BehaviorSubject<double>.seeded(0);
  Sink<double> get inSplittedValue => splittedValue$.sink;
  Stream<double> get outSplittedValue => splittedValue$.stream;

  BehaviorSubject<List<int>> individualValues$ = BehaviorSubject<List<int>>();
  Sink<List<int>> get inIndividualValues => individualValues$.sink;
  Stream<List<int>> get outIndividualValues => individualValues$.stream;

  BehaviorSubject<bool> isResetPressed$ = BehaviorSubject<bool>.seeded(false);
  Sink<bool> get inIsResetPressed => isResetPressed$.sink;
  Stream<bool> get outIsResetPressed => isResetPressed$.stream;

  void setSplittedValue() {
    this.inSplittedValue.add(this.cardInfo.friendsAmount != 0.0
        ? (this.cardInfo.totalAmount / this.cardInfo.friendsAmount)
        : this.cardInfo.totalAmount);
  }

  void setIndividualValues(List<int> value) {
    this.inIndividualValues.add(value);
  }

  void reset() {
    this.inIsResetPressed.add(true);
    List<int> temp = List<int>.generate(
        this.cardInfo.friendsAmount == 0 ? 1 : this.cardInfo.friendsAmount,
        (index) => this.splittedValue$.value.round());
    this.setIndividualValues(temp);
    Future.delayed(Duration(milliseconds: 500), () {
      this.inIsResetPressed.add(false);
    });
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    splittedValue$.close();
    individualValues$.close();
    isResetPressed$.close();
  }
}
