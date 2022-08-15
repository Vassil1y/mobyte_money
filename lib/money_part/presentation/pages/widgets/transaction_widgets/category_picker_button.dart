import 'package:flutter/material.dart';

import '../../../../../static_data/static_strings.dart';

class CategoryPickerButton extends StatelessWidget {
  CategoryPickerButton({Key? key}) : super(key: key);

  List<PopupMenuItem<ListTile>> itemss = [
    PopupMenuItem(
      child: DropdownMenuItem(value: salariesDev, child: Text(salariesDev)),
    ),
    PopupMenuItem(
      child: DropdownMenuItem(value: salariesMg, child: Text(salariesMg)),
    ),
    PopupMenuItem(
      child: DropdownMenuItem(value: salariesMg, child: Text(salariesMg)),
    ),
    PopupMenuItem(
      child: DropdownMenuItem(value: salariesMg, child: Text(salariesMg)),
    ),
    PopupMenuItem(
      child: DropdownMenuItem(value: salariesMg, child: Text(salariesMg)),
    ),
    PopupMenuItem(
      child: DropdownMenuItem(value: salariesMg, child: Text(salariesMg)),
    ),
    PopupMenuItem(
      child: DropdownMenuItem(value: salariesMg, child: Text(salariesMg)),
    ),
    PopupMenuItem(
      child: DropdownMenuItem(value: salariesMg, child: Text(salariesMg)),
    ),
    PopupMenuItem(
      child: DropdownMenuItem(value: salariesMg, child: Text(salariesMg)),
    ),
    PopupMenuItem(
      child: DropdownMenuItem(value: salariesMg, child: Text(salariesMg)),
    ),
    PopupMenuItem(
      child: DropdownMenuItem(value: salariesMg, child: Text(salariesMg)),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width, 64),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      onPressed: () {},
      child: PopupMenuButton(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 64,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Category",
                style: TextStyle(color: Colors.grey),
              ),
            )),
        itemBuilder: (BuildContext context) => itemss,

        // hint: const Padding(
        //   padding: EdgeInsets.only(left: 5),
        //   child: Text(
        //     categoryString,
        //     style: TextStyle(color: Colors.grey),
        //   ),
        // ),
        // isExpanded: true,
        // items: items,
        // onChanged: (k) {},
        // underline: Container(),
      ),
    );
  }
}
