import 'package:flutter/material.dart';
import 'package:mobyte_money/money_part/presentation/pages/widgets/transaction_widgets/tiny_widgets/add_button.dart';
import 'package:mobyte_money/money_part/presentation/pages/widgets/transaction_widgets/tiny_widgets/date_picker_button.dart';
import 'package:mobyte_money/money_part/presentation/pages/widgets/transaction_widgets/tiny_widgets/transaction_page_appbar.dart';
import 'package:mobyte_money/money_part/presentation/pages/widgets/transaction_widgets/tiny_widgets/type_buttons.dart';
import 'package:mobyte_money/static_data/static_strings.dart';
import 'package:mobyte_money/static_data/theme.dart';

import '../widgets/transaction_widgets/tiny_widgets/amount_button.dart';
import '../widgets/transaction_widgets/tiny_widgets/category_picker_button.dart';
import '../widgets/transaction_widgets/tiny_widgets/description_button.dart';
import '../widgets/transaction_widgets/tiny_widgets/status_buttons.dart';

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

  String title;
  bool transactionType;
  bool status;
  DateTime date = DateTime.now();
  String category;
  int amount;
  String description;

  Color backgroundColorOfProfit = AppTheme.mainColor;
  Color backgroundColorOfLoss = AppTheme.lightColor;
  Color backgroundColorOfOk = AppTheme.mainColor;
  Color backgroundColorOfWait = AppTheme.lightColor;

  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(
        value: salariesDev,
        child: Row(children: [
          Container(
              child: Text(salariesDev),
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(20))))
        ])),
    DropdownMenuItem(value: salariesMg, child: Text(salariesMg)),
    DropdownMenuItem(value: internalHr, child: Text(internalHr)),
    DropdownMenuItem(value: externalHr, child: Text(externalHr)),
    DropdownMenuItem(value: credit, child: Text(credit)),
    DropdownMenuItem(value: dividends, child: Text(dividends)),
    DropdownMenuItem(value: bankCharges, child: Text(bankCharges)),
    DropdownMenuItem(value: taxes, child: Text(taxes)),
    DropdownMenuItem(value: awards, child: Text(awards)),
    DropdownMenuItem(value: profit, child: Text(profit)),
    DropdownMenuItem(value: other, child: Text(other)),
  ];

  //Get id structure:

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: TransactionPageAppbar(
          title: title,
        ),
      ),
      body: SingleChildScrollView(
        // child: Expanded(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
          child: Column(
            children: [
              const TypeButtons(),
              const SizedBox(height: 10),
              const StatusButtons(),
              const SizedBox(height: 10),

              const DatePickerButton(),
              const SizedBox(height: 10),

              // DecoratedBox(
              //   decoration: BoxDecoration(
              //       color:AppTheme.lightColor, //background color of dropdown button
              //       border: Border.all(width:0.5, color: Colors.grey), //border of dropdown button
              //       borderRadius: BorderRadius.circular(12), //border raiuds of dropdown button
              //   ),

              CategoryPickerButton(),
              const SizedBox(height: 10),

              const AmountButton(),
              const SizedBox(height: 10),
              const DescriptionButton(),
              const SizedBox(height: 20),
              const AddButton(),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
