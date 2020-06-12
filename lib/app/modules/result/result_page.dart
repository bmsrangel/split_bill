import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/widgets/card/card_widget.dart';
import '../../shared/widgets/custom_app_bar/custom_app_bar_widget.dart';
import 'result_bloc.dart';
import 'widgets/individual_values/individual_values_widget.dart';

class ResultPage extends StatefulWidget {
  final String title;
  const ResultPage({Key key, this.title = "Result"}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final ResultBloc bloc = Modular.get<ResultBloc>();

  @override
  void initState() {
    bloc.setSplittedValue();
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
              title: "EQUALLY DIVIDED",
              color: Color(0xFF13AA4E),
              billValue: Stream.value(bloc.cardInfo.billValue),
              friendsNumber: Stream.value(bloc.cardInfo.friendsAmount),
              tips: Stream.value(bloc.cardInfo.tips),
              tipsAmount: Stream.value(bloc.cardInfo.tipsAmount),
              totalAmount: bloc.outSplittedValue,
            ),
            const SizedBox(height: 25),
            IndividualValuesWidget(
              friendsNumber: bloc.cardInfo.friendsAmount,
              totalAmount: bloc.cardInfo.totalAmount.round(),
              individualValues: bloc.outIndividualValues,
              isResetPressed: bloc.outIsResetPressed,
              onChanged: (value) => bloc.setIndividualValues(value),
            )
          ],
        ),
      ),
    );
  }
}
