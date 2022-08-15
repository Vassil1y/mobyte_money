import 'package:flutter/material.dart';

import '../../../../../static_data/theme.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppTheme.mainColor,
        minimumSize: Size(MediaQuery.of(context).size.width, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      onPressed: () {},
      child: const Text(
        "Add",
        style: TextStyle(
            color: AppTheme.lightColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
