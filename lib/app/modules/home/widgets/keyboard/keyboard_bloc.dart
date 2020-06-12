import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class KeyboardBloc extends Disposable {
  //dispose will be called automatically by closing its streams
  List<dynamic> keys = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "+",
    "0",
    Icons.backspace,
  ];

  String input = "";

  double partialTotal = 0.0;

  void reset() {
    this.clearInput();
    this.partialTotal = 0.0;
  }

  void keyPressAction(dynamic item) {
    if (item == Icons.backspace) {
      this.clearInput();
    } else if (item == "+") {
      if (input.isNotEmpty) {
        partialTotal += double.tryParse(input);
      }
      this.clearInput();
      print(partialTotal);
    } else {
      input += item;
      print(input);
    }
  }

  void clearInput() {
    this.input = "";
  }

  @override
  void dispose() {}
}
