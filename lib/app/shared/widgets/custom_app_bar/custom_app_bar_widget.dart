import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  CustomAppBarWidget({Key key, @required this.title, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        this.title ?? "",
        style: TextStyle(
          color: Colors.black,
          letterSpacing: .5,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: this.actions,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
