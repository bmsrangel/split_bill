import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/widgets/card/card_widget.dart';
import '../../shared/widgets/custom_app_bar/custom_app_bar_widget.dart';
import 'result_controller.dart';
import 'widgets/individual_values/individual_values_widget.dart';

class ResultPage extends StatefulWidget {
  final String title;
  const ResultPage({Key key, this.title = "Result"}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends ModularState<ResultPage, ResultController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.setSplittedValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: "Result",
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: controller.reset,
          )
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            CardWidget(
              title: "EQUALLY DIVIDED",
              color: Color(0xFF13AA4E),
              billValue: controller.cardInfo.billValue,
              friendsNumber: controller.cardInfo.friendsAmount,
              tips: controller.cardInfo.tips,
              tipsAmount: controller.cardInfo.tipsAmount,
              totalAmount: controller.splittedValue.toDouble(),
            ),
            const SizedBox(height: 25),
            Observer(
              builder: (_) {
                return IndividualValuesWidget(
                  friendsNumber: controller.cardInfo.friendsAmount,
                  totalAmount: controller.cardInfo.totalAmount.round(),
                  individualValues: controller.individualValues,
                  onChanged: (value) => controller.setIndividualValues(value),
                  isResetPressed: controller.isResetPressed,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
