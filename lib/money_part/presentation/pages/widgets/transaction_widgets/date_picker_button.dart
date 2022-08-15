import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../bloc/transaction_page_bloc/transaction_page_bloc.dart';
import 'outlined_button.dart';

class DatePickerButton extends StatelessWidget {
  const DatePickerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: MyOutLinedButton(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: BlocBuilder<TransactionBloc, TransactionState>(
                    buildWhen: (previous, current) {
                      if (current is ChangeDateFieldState) {
                        return true;
                      } else {
                        return false;
                      }
                    },
                    builder: (context, state) {
                      if (state is ChangeDateFieldState) {
                        return Text(
                          state.dateTime.toString(),
                          style: const TextStyle(color: Colors.grey),
                        );
                      } else {
                        return const Text(
                          "Date",
                          style: TextStyle(color: Colors.grey),
                        );
                      }
                    },
                  ),
                  // Text(
                  //   "Date",
                  //   style: TextStyle(color: Colors.grey),
                  // ),
                ),
              ),
              onClick: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2023),
                ).then((value) =>
                    BlocProvider.of<TransactionBloc>(context).add(
                        ChangeDateFieldEvent(
                            dateTime: DateFormat("yyyy-MM-dd")
                                .format(value!))));
              },
            )),
      ],
    );
  }
}
