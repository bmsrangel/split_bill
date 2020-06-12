import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/card_info_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  double friendsNumber = 0;

  @observable
  double totalAmount = 0.0;

  @observable
  int tipsAmount = 0;

  @observable
  double tips = 0;

  @observable
  double billValue = 0;

  @observable
  bool isResetPressed = false;

  List<int> tipsPercentages = [0, 10, 20, 30];

  @observable
  int selectedTipPercentageIndex = 0;

  @action
  void setFriendsAmount(double value) {
    this.friendsNumber = value;
  }

  @action
  void setSelectedTipPercentageIndex(int value) {
    this.selectedTipPercentageIndex = value;
    setTipsPercentage(value);
  }

  @action
  void setTipsPercentage(int index) {
    tipsAmount = tipsPercentages[index];
    this.setTipsValue();
    this.setTotalAmount();
  }

  @action
  void setTipsValue() {
    tips = this.billValue * tipsAmount / 100;
  }

  @action
  void setBillValue(double value) {
    this.billValue = value;
    if (this.tipsAmount != 0) {
      this.setTipsValue();
    }
    this.setTotalAmount();
  }

  @action
  void setTotalAmount() {
    this.totalAmount = this.billValue + this.tips;
  }

  void onSplitBillButtonPressed() {
    Modular.to.pushNamed(
      "/result",
      arguments: CardInfoModel(
        billValue: this.billValue,
        friendsAmount: this.friendsNumber.toInt(),
        tips: this.tips,
        totalAmount: this.totalAmount,
        tipsAmount: this.tipsAmount,
      ),
    );
  }

  @action
  void reset() {
    this.isResetPressed = true;
    this.billValue = 0.0;
    this.friendsNumber = 0.0;
    this.selectedTipPercentageIndex = 0;
    this.tips = 0.0;
    this.tipsAmount = 0;
    this.totalAmount = 0.0;
    Future.delayed(Duration(milliseconds: 200), () {
      this.isResetPressed = false;
    });
  }
}
