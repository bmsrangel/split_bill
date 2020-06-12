import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'individual_values_bloc.dart';

class IndividualValuesWidget extends StatefulWidget {
  final int friendsNumber;
  final int totalAmount;
  final Stream<List<int>> individualValues;
  final Stream<bool> isResetPressed;
  final ValueChanged<List<int>> onChanged;

  IndividualValuesWidget(
      {Key key,
      this.friendsNumber,
      this.totalAmount,
      this.onChanged,
      this.individualValues,
      this.isResetPressed})
      : super(key: key);

  @override
  _IndividualValuesWidgetState createState() => _IndividualValuesWidgetState();
}

class _IndividualValuesWidgetState extends State<IndividualValuesWidget> {
  final IndividualValuesBloc bloc = Modular.get<IndividualValuesBloc>();

  StreamSubscription individualValuesSubs;
  StreamSubscription isResetPressedSubs;

  @override
  void initState() {
    individualValuesSubs = this.widget.individualValues.listen((event) {
      this.bloc.inIndividualValues.add(event);
      this.bloc.individualValues = event;
    });
    isResetPressedSubs = this.widget.isResetPressed.listen((event) {
      if (event) {
        this.bloc.reset();
      }
    });
    this.bloc.totalAmount = this.widget.totalAmount;

    super.initState();
  }

  @override
  void dispose() {
    individualValuesSubs.cancel();
    isResetPressedSubs.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color sliderColor = Colors.grey[200];

    return Expanded(
      child: ListView.builder(
        itemCount:
            this.widget.friendsNumber == 0 ? 1 : this.widget.friendsNumber,
        itemBuilder: (_, index) {
          return Card(
            child: Container(
              height: 100,
              width: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Person ${index + 1}",
                        style: TextStyle(fontSize: 12),
                      ),
                      StreamBuilder<List<int>>(
                          stream: bloc.outIndividualValues,
                          initialData: [],
                          builder: (context, snapshot) {
                            if (snapshot.data.isNotEmpty)
                              return Text(
                                "\$${snapshot.data[index]}",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            return Container();
                          })
                    ],
                  ),
                  Positioned(
                    width: size.width,
                    height: 25,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SliderTheme(
                        data: SliderThemeData(
                          activeTrackColor: sliderColor,
                          inactiveTrackColor: sliderColor,
                          inactiveTickMarkColor: sliderColor,
                          activeTickMarkColor: sliderColor,
                          thumbColor: Colors.grey[300],
                        ),
                        child: StreamBuilder<List<int>>(
                            stream: bloc.outIndividualValues,
                            initialData: [],
                            builder: (context, snapshot) {
                              if (snapshot.data.isNotEmpty) {
                                List<int> tempList = List.from(snapshot.data);
                                return Slider(
                                  key: Key(index.toString()),
                                  onChanged: (value) {
                                    tempList[index] = value.round();
                                    bloc.inIndividualValues.add(tempList);
                                    this
                                        .bloc
                                        .recalculateIndividualValues(index);
                                    this.widget.onChanged(tempList);
                                  },
                                  value: snapshot.data[index].toDouble(),
                                  min: 0,
                                  max: this.widget.totalAmount.toDouble(),
                                  divisions: this.widget.totalAmount == 0
                                      ? 1
                                      : this.widget.totalAmount,
                                );
                              }
                              return Container();
                            }),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
