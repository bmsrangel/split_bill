import 'package:flutter/material.dart';

class SelectedTipCheckWidget extends StatelessWidget {
  final Size screenSize;
  final Color color;
  final double borderRadius;
  final bool isSelected;

  const SelectedTipCheckWidget(
      {Key key,
      @required this.screenSize,
      @required this.color,
      this.borderRadius = 0,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Stack(
        children: [
          Container(
            width: this.screenSize.width * .15,
            height: this.screenSize.height * .05,
            decoration: BoxDecoration(
              color: this.color,
              borderRadius: BorderRadius.circular(this.borderRadius),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: this.isSelected
                ? Icon(Icons.check, size: 12, color: Colors.white)
                : const SizedBox(),
          )
        ],
      ),
      clipper: ContainerClipper(),
    );
  }
}

class ContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path
      ..lineTo(size.width * .55, 0)
      ..lineTo(size.width, size.height * .5)
      ..lineTo(size.width, 0)
      ..lineTo(size.width * .55, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
