import 'package:flutter/material.dart';

class DescriptionButton extends StatelessWidget {
  const DescriptionButton({Key? key}) : super(key: key);

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
      child: const Padding(
        padding: EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.topLeft,
          child: TextField(
            minLines: 5,
            maxLines: 5,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Description",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
