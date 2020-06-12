import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/widgets/card/card_widget.dart';
import '../../shared/widgets/custom_app_bar/custom_app_bar_widget.dart';
import 'home_controller.dart';
import 'widgets/keyboard/keyboard_widget.dart';
import 'widgets/slider/slider_widget.dart';
import 'widgets/split_button/split_button_widget.dart';
import 'widgets/tips_percent_selector/tips_percent_selector_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        title: "Split Bill",
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
            Observer(
              builder: (_) {
                return CardWidget(
                  title: "TOTAL",
                  friendsNumber: controller.friendsNumber.toInt(),
                  tipsAmount: controller.tipsAmount,
                  tips: controller.tips,
                  totalAmount: controller.totalAmount,
                  billValue: controller.billValue,
                );
              },
            ),
            const SizedBox(height: 25),
            Observer(
              builder: (_) {
                return SliderWidget(
                  friendsNumber: controller.friendsNumber,
                  onChanged: controller.setFriendsAmount,
                );
              },
            ),
            const SizedBox(height: 10),
            Observer(
              builder: (_) {
                return TipsPercentSelectorWidget(
                  screenSize: size,
                  color: Color(0xFF00C24C),
                  tipsPercentages: controller.tipsPercentages,
                  selectedIndex: controller.selectedTipPercentageIndex,
                  onPressed: (value) {
                    controller.setSelectedTipPercentageIndex(value);
                    controller.setTipsValue();
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            Observer(
              builder: (_) {
                return KeyboardWidget(
                  reset: controller.isResetPressed,
                  onValueUpdated: (value) {
                    controller.setBillValue(value);
                  },
                );
              },
            ),
            SplitButtonWidget(
              screenSize: size,
              color: Color(0xFF00C24C),
              buttonLabel: "SPLIT BILL",
              onPressed: controller.onSplitBillButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
