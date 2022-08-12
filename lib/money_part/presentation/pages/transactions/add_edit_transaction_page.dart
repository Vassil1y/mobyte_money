import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_money/money_part/presentation/pages/widgets/transaction_page_appbar.dart';
import 'package:mobyte_money/money_part/presentation/pages/widgets/transaction_page_button.dart';
import 'package:mobyte_money/static_data/static_strings.dart';
import 'package:mobyte_money/static_data/theme.dart';

import '../../../bloc/transaction_page_bloc/transaction_page_bloc.dart';

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

  List<DropdownMenuItem<String>> items = const [
    DropdownMenuItem(value: "USA", child: Text("USA")),
    DropdownMenuItem(value: "USA", child: Text("USA")),
  ];

  @override
  Widget build(BuildContext context) {
    void typeChangeToTrue() {
      BlocProvider.of<TransactionBloc>(context)
          .add(const ChangeTypeButtonColorToTrueEvent());
    }

    void typeChangeToFalse() {
      BlocProvider.of<TransactionBloc>(context)
          .add(const ChangeTypeButtonColorToFalseEvent());
    }

    void statusChangeToTrue() {
      BlocProvider.of<TransactionBloc>(context)
          .add(const ChangeStatusButtonColorToTrueEvent());
    }

    void statusChangeToFalse() {
      BlocProvider.of<TransactionBloc>(context)
          .add(const ChangeStatusButtonColorToFalseEvent());
    }

    return Scaffold(
      backgroundColor: AppTheme.backColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: TransactionPageAppbar(
          title: title,
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      transactionTypeString,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BlocBuilder<TransactionBloc, TransactionState>(
                          buildWhen: (previous, current) {
                            if (current is ChangeTypeButtonColorToTrue ||
                                current is ChangeTypeButtonColorToFalse) {
                              return true;
                            } else {
                              return false;
                            }
                          },
                          builder: (context, state) {
                            if (state is ChangeTypeButtonColorToTrue) {
                              return TransactionPageButton(
                                backgroundColor:
                                    AppTheme.mainColor.withOpacity(0.3),
                                text: profit,
                                clickFunction: typeChangeToTrue,
                              );
                            } else if (state is ChangeTypeButtonColorToFalse) {
                              return TransactionPageButton(
                                backgroundColor: AppTheme.lightColor,
                                text: profit,
                                clickFunction: typeChangeToTrue,
                              );
                            } else {
                              return TransactionPageButton(
                                backgroundColor:
                                    AppTheme.mainColor.withOpacity(0.3),
                                text: profit,
                                clickFunction: typeChangeToTrue,
                              );
                            }
                          },
                        ),
                        BlocBuilder<TransactionBloc, TransactionState>(
                          buildWhen: (previous, current) {
                            if (current is ChangeTypeButtonColorToTrue ||
                                current is ChangeTypeButtonColorToFalse) {
                              return true;
                            } else {
                              return false;
                            }
                          },
                          builder: (context, state) {
                            if (state is ChangeTypeButtonColorToTrue) {
                              return TransactionPageButton(
                                backgroundColor: AppTheme.lightColor,
                                text: loss,
                                clickFunction: typeChangeToFalse,
                              );
                            } else if (state is ChangeTypeButtonColorToFalse) {
                              return TransactionPageButton(
                                backgroundColor:
                                    AppTheme.mainColor.withOpacity(0.3),
                                text: loss,
                                clickFunction: typeChangeToFalse,
                              );
                            } else {
                              return TransactionPageButton(
                                backgroundColor: AppTheme.lightColor,
                                text: loss,
                                clickFunction: typeChangeToFalse,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      transactionStatus,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BlocBuilder<TransactionBloc, TransactionState>(
                          buildWhen: (previous, current) {
                            if (current is ChangeStatusButtonColorToTrue ||
                                current is ChangeStatusButtonColorToFalse) {
                              return true;
                            } else {
                              return false;
                            }
                          },
                          builder: (context, state) {
                            if (state is ChangeStatusButtonColorToTrue) {
                              return TransactionPageButton(
                                backgroundColor:
                                    AppTheme.mainColor.withOpacity(0.3),
                                text: transactionStatusOk,
                                clickFunction: statusChangeToTrue,
                              );
                            } else if (state
                                is ChangeStatusButtonColorToFalse) {
                              return TransactionPageButton(
                                backgroundColor: AppTheme.lightColor,
                                text: transactionStatusOk,
                                clickFunction: statusChangeToTrue,
                              );
                            } else {
                              return TransactionPageButton(
                                backgroundColor:
                                    AppTheme.mainColor.withOpacity(0.3),
                                text: transactionStatusOk,
                                clickFunction: statusChangeToTrue,
                              );
                            }
                          },
                        ),
                        BlocBuilder<TransactionBloc, TransactionState>(
                          buildWhen: (previous, current) {
                            if (current is ChangeStatusButtonColorToTrue ||
                                current is ChangeStatusButtonColorToFalse) {
                              return true;
                            } else {
                              return false;
                            }
                          },
                          builder: (context, state) {
                            if (state is ChangeStatusButtonColorToTrue) {
                              return TransactionPageButton(
                                backgroundColor: AppTheme.lightColor,
                                text: transactionStatusWait,
                                clickFunction: statusChangeToFalse,
                              );
                            } else if (state
                                is ChangeStatusButtonColorToFalse) {
                              return TransactionPageButton(
                                backgroundColor:
                                    AppTheme.mainColor.withOpacity(0.3),
                                text: transactionStatusWait,
                                clickFunction: statusChangeToFalse,
                              );
                            } else {
                              return TransactionPageButton(
                                backgroundColor: AppTheme.lightColor,
                                text: transactionStatusWait,
                                clickFunction: statusChangeToFalse,
                              );
                            }
                          },
                        ),
                        // TransactionPageButton(
                        //   backgroundColor: AppTheme.mainColor.withOpacity(0.3),
                        //   text: transactionStatusOk,
                        // ),
                        // TransactionPageButton(
                        //   backgroundColor: AppTheme.lightColor,
                        //   text: transactionStatusWait,
                        // ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(0, 64),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2023),
                          ).then((value) => print(value));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Date",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // DecoratedBox(
                //   decoration: BoxDecoration(
                //       color:AppTheme.lightColor, //background color of dropdown button
                //       border: Border.all(width:0.5, color: Colors.grey), //border of dropdown button
                //       borderRadius: BorderRadius.circular(12), //border raiuds of dropdown button
                //   ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 64),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () {},
                  child: DropdownButton(
                    hint: const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        categoryString,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    isExpanded: true,
                    items: items,
                    onChanged: (k) {},
                    underline: Container(),
                  ),
                ),
                const SizedBox(height: 10),

                OutlinedButton(
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
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 125),
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Description",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppTheme.mainColor,
                    minimumSize: const Size(500, 52),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
