import 'package:flutter/material.dart';

class CardInfoWidget extends StatelessWidget {
  final TextStyle detailsStyle;
  final Stream<double> billValue;
  final Stream<int> friendsNumber;
  final Stream<int> tipsAmount;
  final Stream<double> tips;

  const CardInfoWidget({
    Key key,
    @required this.detailsStyle,
    this.billValue,
    this.friendsNumber,
    this.tipsAmount,
    this.tips,
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
            StreamBuilder<int>(
                stream: this.tipsAmount,
                builder: (context, snapshot) {
                  return Text(
                    "TIPS(${snapshot.data}%)",
                    style: detailsStyle,
                  );
                }),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<double>(
              stream: this.billValue,
              initialData: 0.0,
              builder: (context, snapshot) {
                return Text(
                  "\$${snapshot.data.toStringAsFixed(2)}",
                  style: detailsStyle,
                );
              },
            ),
            StreamBuilder<int>(
                stream: this.friendsNumber,
                builder: (context, snapshot) {
                  return Text(
                    "${snapshot.data}",
                    style: detailsStyle,
                  );
                }),
            StreamBuilder<double>(
                stream: this.tips,
                initialData: 0.0,
                builder: (context, snapshot) {
                  return Text(
                    "\$${snapshot.data.toStringAsFixed(2)}",
                    style: detailsStyle,
                  );
                }),
          ],
        ),
      ],
    );
  }
}
