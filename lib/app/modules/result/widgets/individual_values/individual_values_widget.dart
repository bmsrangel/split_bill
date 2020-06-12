import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'individual_values_store.dart';

class IndividualValuesWidget extends StatelessWidget {
  final int friendsNumber;
  final int totalAmount;
  final List<int> individualValues;
  final ValueChanged<List<int>> onChanged;
  final bool isResetPressed;

  final IndividualValuesStore controller = Modular.get<IndividualValuesStore>();

  IndividualValuesWidget(
      {Key key,
      this.friendsNumber,
      this.totalAmount,
      this.onChanged,
      this.individualValues,
      this.isResetPressed = false})
      : super(key: key) {
    this.controller.individualValues = this.individualValues;
    this.controller.totalAmount = this.totalAmount;
    if (this.isResetPressed) {
      this.controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color sliderColor = Colors.grey[200];

    return Expanded(
      child: ListView.builder(
          itemCount: this.friendsNumber == 0 ? 1 : this.friendsNumber,
          itemBuilder: (_, index) {
            return Card(
              child: Container(
                height: 100,
                width: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Person ${index + 1}",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "\$${this.controller.individualValues[index]}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      width: size.width,
                      height: 25,
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: sliderColor,
                            inactiveTrackColor: sliderColor,
                            inactiveTickMarkColor: sliderColor,
                            activeTickMarkColor: sliderColor,
                            thumbColor: Colors.grey[300],
                          ),
                          child: Slider(
                            key: Key(index.toString()),
                            onChanged: (value) {
                              this.controller.individualValues[index] =
                                  value.round();
                              this
                                  .controller
                                  .recalculateIndividualValues(index);
                              this.onChanged(this.controller.individualValues);
                            },
                            value: this
                                .controller
                                .individualValues[index]
                                .toDouble(),
                            min: 0,
                            max: this.totalAmount.toDouble(),
                            divisions:
                                this.totalAmount == 0 ? 1 : this.totalAmount,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
