import 'package:flutter/material.dart';

import '../../../../../../static_data/theme.dart';

class TransactionPageButton extends StatelessWidget {
  const TransactionPageButton(
      {Key? key,
      required this.backgroundColor,
      required this.text,
      required this.clickFunction()})
      : super(key: key);
  final Color backgroundColor;
  final String text;
  final Function() clickFunction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, 64),
          backgroundColor: backgroundColor,
          // AppTheme.mainColor.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
        ),
        onPressed: () {
          clickFunction();
        },
        child: Text(
          text,
          style: TextStyle(color: AppTheme.mainColor),
        ),
      ),
    );
  }
}
