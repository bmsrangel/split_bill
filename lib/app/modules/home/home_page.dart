import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/widgets/card/card_widget.dart';
import '../../shared/widgets/custom_app_bar/custom_app_bar_widget.dart';
import 'home_bloc.dart';
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

class _HomePageState extends State<HomePage> {
  final HomeBloc bloc = Modular.get<HomeBloc>();
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
            onPressed: bloc.reset,
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
              title: "TOTAL",
              friendsNumber: bloc.outFriendsNumber,
              tipsAmount: bloc.outTipsAmount,
              tips: bloc.outTips,
              totalAmount: bloc.outTotalAmount,
              billValue: bloc.outBillValue,
            ),
            const SizedBox(height: 25),
            SliderWidget(
              friendsNumber: bloc.outFriendsNumber,
              onChanged: bloc.setFriendsAmount,
            ),
            const SizedBox(height: 10),
            TipsPercentSelectorWidget(
              screenSize: size,
              color: Color(0xFF00C24C),
              tipsPercentages: bloc.tipsPercentages,
              selectedIndex: bloc.outSelectedTipPercentageIndex,
              onPressed: (value) {
                bloc.setSelectedTipPercentageIndex(value);
                bloc.setTipsValue();
              },
            ),
            const SizedBox(height: 10),
            KeyboardWidget(
              reset: bloc.isResetPressed,
              onValueUpdated: (value) {
                bloc.setBillValue(value);
              },
            ),
            SplitButtonWidget(
              screenSize: size,
              color: Color(0xFF00C24C),
              buttonLabel: "SPLIT BILL",
              onPressed: bloc.onSplitBillButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}
