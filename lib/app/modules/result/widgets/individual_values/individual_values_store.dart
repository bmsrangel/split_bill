import 'package:mobx/mobx.dart';

part 'individual_values_store.g.dart';

class IndividualValuesStore = _IndividualValuesStoreBase
    with _$IndividualValuesStore;

abstract class _IndividualValuesStoreBase with Store {
  @observable
  List<int> individualValues;

  Set<int> adjustedValuesIndexes = Set<int>();

  int totalAmount;

  int lastValidValue;

  @action
  void recalculateIndividualValues(int index) {
    int diff = this.totalAmount;

    this.adjustedValuesIndexes.add(index);
    this.adjustedValuesIndexes.forEach((element) {
      diff -= this.individualValues[element];
    });
    if (diff >= 0) {
      for (int i = 0; i < individualValues.length; i++) {
        if (i != index &&
            this.adjustedValuesIndexes.length == this.individualValues.length) {
          this.individualValues[index] < this.lastValidValue
              ? this.individualValues[i] +=
                  (diff / this.individualValues.length).round()
              : this.individualValues[i] -=
                  (diff / this.individualValues.length).round();
        }
        if (i != index && !adjustedValuesIndexes.contains(i)) {
          this.individualValues[i] = (diff /
                  (this.individualValues.length - adjustedValuesIndexes.length))
              .round();
        }
      }
      this.lastValidValue = this.individualValues[index];
    } else {
      this.individualValues[index] = this.lastValidValue;
    }
  }

  @action
  void reset() {
    this.adjustedValuesIndexes.clear();
    this.lastValidValue = null;
  }
}
