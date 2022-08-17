import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_money/money_part/bloc/transaction_page_bloc/transaction_page_bloc.dart';

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
      child: TextField(
        keyboardType: TextInputType.number,
        onSubmitted: (value) {
          BlocProvider.of<TransactionBloc>(context)
              .add(ChangeAmountFieldEvent(amount: int.parse(value)));
        },
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Enter Amount",
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.only(left: 5)),
      ),
    );
  }
}
