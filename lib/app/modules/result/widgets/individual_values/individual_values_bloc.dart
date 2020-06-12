import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

class IndividualValuesBloc extends Disposable {
  List<int> individualValues;
  BehaviorSubject<List<int>> individualValues$ =
      BehaviorSubject<List<int>>.seeded([]);
  Sink<List<int>> get inIndividualValues => individualValues$.sink;
  Stream<List<int>> get outIndividualValues => individualValues$.stream;

  Set<int> adjustedValuesIndexes = Set<int>();

  int totalAmount;

  int lastValidValue;

  void recalculateIndividualValues(int index) {
    this.individualValues = this.individualValues$.value;
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
      this.inIndividualValues.add(this.individualValues);
    } else {
      this.individualValues[index] = this.lastValidValue;
      this.inIndividualValues.add(this.individualValues);
    }
  }

  void reset() {
    this.adjustedValuesIndexes.clear();
    this.lastValidValue = null;
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    individualValues$.close();
  }
}
