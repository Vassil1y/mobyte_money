import 'package:flutter/material.dart';

class AmountButton extends StatelessWidget {
  const AmountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 64),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      onPressed: () {},
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter Amount",
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.only(left: 5)),
      ),
    );
  }
}
