import 'package:flutter/material.dart';

class SplitButtonWidget extends StatelessWidget {
  final String buttonLabel;
  final Color color;
  final Function onPressed;
  final Size screenSize;

  const SplitButtonWidget(
      {Key key, this.buttonLabel, this.color, this.onPressed, this.screenSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: this.onPressed,
        child: Container(
          width: this.screenSize.width,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: this.color,
          ),
          child: Text(
            this.buttonLabel,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
