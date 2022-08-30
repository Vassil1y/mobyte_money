import 'package:flutter/material.dart';

class MyOutLinedButton extends StatelessWidget {
  const MyOutLinedButton(
      {Key? key, this.height = 64, required this.onClick, required this.child})
      : super(key: key);
  final double height;
  final Function() onClick;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
        ),
        onPressed: () {
          onClick();
        },
        child: child);
  }
}
