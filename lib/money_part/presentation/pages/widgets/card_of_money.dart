import 'package:flutter/material.dart';

class CardOfMoney extends StatelessWidget {
  const CardOfMoney({Key? key, required this.backgroundColor})
      : super(key: key);
  final backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      height: 60,
      width: 160,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          color: backgroundColor),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [Text("data"), Text("data")],
        ),
      ),
    );
  }
}
