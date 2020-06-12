import 'package:flutter/material.dart';

import '../selected_tip_check/selected_tip_check_widget.dart';

class TipsPercentSelectorWidget extends StatelessWidget {
  final Size screenSize;
  final List<int> tipsPercentages;
  final Stream<int> selectedIndex;
  final ValueChanged<int> onPressed;
  final Color color;

  TipsPercentSelectorWidget(
      {Key key,
      this.screenSize,
      this.tipsPercentages,
      this.selectedIndex,
      this.onPressed,
      this.color = Colors.black})
      : super(key: key);

  bool isIndexSelected(int selectedIndex, int item) {
    return selectedIndex == this.tipsPercentages.indexOf(item);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: this
          .tipsPercentages
          .map(
            (item) => InkWell(
              onTap: () {
                this.onPressed(tipsPercentages.indexOf(item));
              },
              child: StreamBuilder<int>(
                stream: this.selectedIndex,
                builder: (context, snapshot) {
                  return Stack(
                    children: [
                      Container(
                        width: this.screenSize.width * .15,
                        height: this.screenSize.height * .05,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 1.5,
                            color: this.isIndexSelected(snapshot.data, item)
                                ? this.color
                                : Colors.grey,
                          ),
                        ),
                        child: Text("$item%"),
                      ),
                      SelectedTipCheckWidget(
                        screenSize: this.screenSize,
                        color: this.isIndexSelected(snapshot.data, item)
                            ? this.color
                            : Colors.transparent,
                        borderRadius: 5,
                        isSelected: this.isIndexSelected(snapshot.data, item),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
