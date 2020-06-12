import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'keyboard_bloc.dart';

class KeyboardWidget extends StatelessWidget {
  final KeyboardBloc bloc = Modular.get<KeyboardBloc>();
  final ValueChanged<double> onValueUpdated;
  final bool reset;

  KeyboardWidget({Key key, this.onValueUpdated, this.reset}) : super(key: key) {
    if (this.reset) {
      bloc.reset();
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
        children: bloc.keys
            .map(
              (e) => InkWell(
                onTap: () {
                  bloc.keyPressAction(e);
                  this.onValueUpdated(bloc.partialTotal);
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
