import 'package:flutter/material.dart';

class CardInfoWidget extends StatelessWidget {
  final TextStyle detailsStyle;
  final double billValue;
  final int friendsNumber;
  final int tipsAmount;
  final double tips;

  const CardInfoWidget({
    Key key,
    @required this.detailsStyle,
    this.billValue = 0.0,
    this.friendsNumber = 2,
    this.tipsAmount = 0,
    this.tips = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BILL",
              style: detailsStyle,
            ),
            Text(
              "FRIENDS",
              style: detailsStyle,
            ),
            Text(
              "TIPS(${this.tipsAmount}%)",
              style: detailsStyle,
            ),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "\$${this.billValue.toStringAsFixed(2)}",
              style: detailsStyle,
            ),
            Text(
              "${this.friendsNumber}",
              style: detailsStyle,
            ),
            Text(
              "\$${this.tips.toStringAsFixed(2)}",
              style: detailsStyle,
            ),
          ],
        ),
      ],
    );
  }
}
