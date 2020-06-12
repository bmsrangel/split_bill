import 'package:flutter/material.dart';

import 'components/custom_thumb_shape.dart';
import 'components/custom_track_shape.dart';

class SliderWidget extends StatelessWidget {
  final double friendsNumber;
  final Function onChanged;

  const SliderWidget({Key key, this.friendsNumber, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        inactiveTrackColor: Color(0xFFF1F1F1),
        trackHeight: 40.0,
        trackShape: CustomTrackShape(),
        thumbShape: CustomThumbShape(thumbHeight: 55, thumbWidth: 8),
        tickMarkShape: SliderTickMarkShape.noTickMark,
        overlayShape: CustomThumbShape(thumbHeight: 55, thumbWidth: 8),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Slider(
            onChanged: this.onChanged,
            value: this.friendsNumber,
            min: 0,
            max: 10,
            divisions: 10,
            activeColor: Color(0xFF0E1822),
          ),
          Positioned(
            left: 10,
            child: Icon(
              Icons.people_outline,
              size: 22,
              color: this.friendsNumber > 0 ? Colors.white : Colors.black,
            ),
          ),
          Positioned(
            right: 20,
            child: Text(
              "${this.friendsNumber.toStringAsFixed(0)}",
              style: TextStyle(
                color: this.friendsNumber < 10 ? Colors.black : Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
