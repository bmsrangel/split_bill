import 'package:mobx/mobx.dart';

import '../../shared/models/card_info_model.dart';

part 'result_controller.g.dart';

class ResultController = _ResultControllerBase with _$ResultController;

abstract class _ResultControllerBase with Store {
  final CardInfoModel cardInfo;

  _ResultControllerBase(this.cardInfo) {
    this.setSplittedValue();
    List<int> temp = List<int>.generate(
        this.cardInfo.friendsAmount == 0 ? 1 : this.cardInfo.friendsAmount,
        (index) => this.splittedValue);
    this.setIndividualValues(temp);
  }

  @observable
  int splittedValue = 0;

  @observable
  List<int> individualValues;

  @observable
  bool isResetPressed = false;

  @action
  void setSplittedValue() {
    this.splittedValue = this.cardInfo.friendsAmount != 0
        ? (this.cardInfo.totalAmount / this.cardInfo.friendsAmount).round()
        : this.cardInfo.totalAmount.round();
  }

  @action
  void setIndividualValues(List<int> value) {
    this.individualValues = value;
  }

  @action
  void reset() {
    this.isResetPressed = true;
    List<int> temp = List<int>.generate(
        this.cardInfo.friendsAmount == 0 ? 1 : this.cardInfo.friendsAmount,
        (index) => this.splittedValue);
    this.setIndividualValues(temp);
    Future.delayed(Duration(milliseconds: 500), () {
      this.isResetPressed = false;
    });
  }
}
