import 'package:flutter/material.dart';

import '../card_info/card_info_widget.dart';
import '../total/total_widget.dart';
import '../transparent_triangle/transparent_triangle_widget.dart';

class CardWidget extends StatelessWidget {
  final Stream<int> friendsNumber;
  final Stream<int> tipsAmount;
  final Stream<double> totalAmount;
  final Stream<double> tips;
  final Stream<double> billValue;
  final String title;
  final Color color;

  const CardWidget(
      {Key key,
      this.totalAmount,
      this.friendsNumber,
      this.tipsAmount,
      this.tips,
      this.billValue,
      @required this.title,
      this.color = const Color(0xFF0E1822)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle detailsStyle =
        TextStyle(color: Colors.white, fontSize: 12, height: 1.8);
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 45),
            spreadRadius: -30,
            blurRadius: 13,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        color: this.color,
        child: Container(
          width: size.width,
          height: size.height * .18,
          child: Stack(
            overflow: Overflow.clip,
            children: [
              Positioned(
                width: size.width,
                height: size.height * .45,
                right: 0,
                bottom: 0,
                child: TransparentTriangleWidget(),
              ),
              Positioned(
                width: size.width,
                height: size.height * .45,
                right: -85,
                bottom: -5,
                child: TransparentTriangleWidget(),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 10, 0),
                child: Row(
                  children: [
                    TotalWidget(
                      title: this.title,
                      detailsStyle: detailsStyle,
                      totalAmount: this.totalAmount,
                    ),
                    CardInfoWidget(
                      detailsStyle: detailsStyle,
                      billValue: this.billValue,
                      friendsNumber: this.friendsNumber,
                      tipsAmount: this.tipsAmount,
                      tips: this.tips,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
