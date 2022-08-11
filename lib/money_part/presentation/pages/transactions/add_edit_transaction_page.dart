import 'package:flutter/material.dart';
import 'package:mobyte_money/static_data/static_strings.dart';
import 'package:mobyte_money/static_data/theme.dart';

class Transaction extends StatelessWidget {


  Transaction({
    this.title = addTransaction,
    this.transactionType = true,
    this.status = true,
    this.category = categoryString,
    this.amount = 0,
    this.description = "",
    Key? key,
  }) : super(key: key);

  String title = addTransaction;
  bool transactionType;
  bool status = true;
  DateTime date = DateTime.now();
  String category = categoryString;
  int amount = 0;
  String description = "";

  Color backgroundColorOfProfit = AppTheme.mainColor;
  Color backgroundColorOfLoss = AppTheme.lightColor;
  Color backgroundColorOfOk = AppTheme.mainColor;
  Color backgroundColorOfWait = AppTheme.lightColor;

  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(child: Text("USA"), value: "USA"),
    DropdownMenuItem(child: Text("USA"), value: "USA"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backColor,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppTheme.backColor,
          title: Text(
            title,
            style: TextStyle(color: AppTheme.textColor),
          ),
          leading: Container(
            margin: EdgeInsets.all(5),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: AppTheme.mainColor.withOpacity(0.7),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
            ),
          )),
      body: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [],
            ),
            Column(
              children: [
                Text("data"),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text("asda"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("asda"),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Text("data"),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text("asda"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("asda"),
                    ),
                  ],
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2023),
                ).then((value) => print(value));
              },
              child: Text("_date"),
            ),
            DropdownButton(
              value: category,
              items: items,
              onChanged: (k) {},
            ),
            TextField(),
            TextField(),
            TextButton(onPressed: () {}, child: Text("er"))
          ],
        ),
      ),
    );
  }
}
