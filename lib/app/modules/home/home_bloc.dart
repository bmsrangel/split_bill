import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

import '../../shared/models/card_info_model.dart';

class HomeBloc extends Disposable {
  List<int> tipsPercentages = [0, 10, 20, 30];

  BehaviorSubject<int> _friendsNumber$ = BehaviorSubject<int>.seeded(0);
  Sink<int> get inFriendsNumber => _friendsNumber$.sink;
  Stream<int> get outFriendsNumber => _friendsNumber$.stream;

  BehaviorSubject<double> _totalAmount$ = BehaviorSubject<double>.seeded(0.0);
  Sink<double> get inTotalAmount => _totalAmount$.sink;
  Stream<double> get outTotalAmount => _totalAmount$.stream;

  BehaviorSubject<int> _tipsAmount$ = BehaviorSubject<int>.seeded(0);
  Sink<int> get inTipsAmount => _tipsAmount$.sink;
  Stream<int> get outTipsAmount => _tipsAmount$.stream;

  BehaviorSubject<double> _tips$ = BehaviorSubject<double>.seeded(0.0);
  Sink<double> get inTips => _tips$.sink;
  Stream<double> get outTips => _tips$.stream;

  BehaviorSubject<double> _billValue$ = BehaviorSubject<double>.seeded(0.0);
  Sink get inBillValue => _billValue$.sink;
  Stream get outBillValue => _billValue$.stream;

  BehaviorSubject<bool> _isResetPressed$ = BehaviorSubject<bool>.seeded(false);
  Sink<bool> get inIsResetPressed => _isResetPressed$.sink;
  Stream<bool> get outIsResetPressed => _isResetPressed$.stream;

  BehaviorSubject<int> _selectedTipPercentageIndex$ =
      BehaviorSubject<int>.seeded(0);
  Sink<int> get inSelectedTipPercentageIndex =>
      _selectedTipPercentageIndex$.sink;
  Stream<int> get outSelectedTipPercentageIndex =>
      _selectedTipPercentageIndex$.stream;

  bool get isResetPressed => _isResetPressed$.value;

  void setFriendsAmount(double value) {
    this.inFriendsNumber.add(value.round());
  }

  void setSelectedTipPercentageIndex(int value) {
    this.inSelectedTipPercentageIndex.add(value);
    this.setTipsPercentage(value);
  }

  void setTipsPercentage(int index) {
    this.inTipsAmount.add(tipsPercentages[index]);
    this.setTipsValue();
    this.setTotalAmount();
  }

  void setTipsValue() {
    inTips.add(this._billValue$.value * this._tipsAmount$.value / 100);
  }

  void setBillValue(double value) {
    inBillValue.add(value);
    if (this._tipsAmount$.value != 0) {
      this.setTipsValue();
    }
    this.setTotalAmount();
  }

  void setTotalAmount() {
    this.inTotalAmount.add(this._billValue$.value + this._tips$.value);
  }

  void onSplitBillButtonPressed() {
    Modular.to.pushNamed(
      "/result",
      arguments: CardInfoModel(
        billValue: this._billValue$.value,
        friendsAmount: this._friendsNumber$.value.toInt(),
        tips: this._tips$.value,
        totalAmount: this._totalAmount$.value,
        tipsAmount: this._tipsAmount$.value,
      ),
    );
  }

  void reset() {
    this.inIsResetPressed.add(true);
    this.inBillValue.add(0.0);
    this.inFriendsNumber.add(0);
    this.inSelectedTipPercentageIndex.add(0);
    this.inTips.add(0.0);
    this.inTipsAmount.add(0);
    this.inTotalAmount.add(0.0);
    Future.delayed(Duration(milliseconds: 200), () {
      this.inIsResetPressed.add(false);
    });
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _billValue$.close();
    _tips$.close();
    _tipsAmount$.close();
    _totalAmount$.close();
    _friendsNumber$.close();
    _isResetPressed$.close();
    _selectedTipPercentageIndex$.close();
  }
}
