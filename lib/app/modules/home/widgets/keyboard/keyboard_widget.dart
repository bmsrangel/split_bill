import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'keyboard_controller.dart';

class KeyboardWidget extends StatelessWidget {
  final KeyboardController controller = Modular.get<KeyboardController>();
  final ValueChanged<double> onValueUpdated;
  final bool reset;

  KeyboardWidget({Key key, this.onValueUpdated, this.reset}) : super(key: key) {
    if (this.reset) {
      controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.zero,
        childAspectRatio: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        physics: NeverScrollableScrollPhysics(),
        children: controller.keys
            .map(
              (e) => InkWell(
                onTap: () {
                  controller.keyPressAction(e);
                  this.onValueUpdated(controller.partialTotal);
                },
                child: Center(
                  child: e.runtimeType == String
                      ? Text(e,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ))
                      : Icon(e, color: Colors.red),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
