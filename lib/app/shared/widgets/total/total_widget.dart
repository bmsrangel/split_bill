import 'package:flutter/material.dart';

class TotalWidget extends StatelessWidget {
  final TextStyle detailsStyle;
  final double totalAmount;
  final String title;

  const TotalWidget(
      {Key key,
      @required this.detailsStyle,
      @required this.totalAmount,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.title,
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 2),
          Text(
            "\$${this.totalAmount?.toStringAsFixed(2) ?? 0.toStringAsFixed(2)}",
            style: this.detailsStyle.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
          ),
        ],
      ),
    );
  }
}
