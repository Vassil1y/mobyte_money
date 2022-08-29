import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_money/money_part/bloc/transaction_page_bloc/transaction_page_bloc.dart';

import '../../../../../static_data/theme.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionBloc, TransactionState>(
      listener: (context, state){
        if(state is AddButtonPressedDoneState){
          Navigator.pop(context);
        }
      },
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppTheme.mainColor,
          minimumSize: Size(MediaQuery.of(context).size.width, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
        ),
        onPressed: () {
          BlocProvider.of<TransactionBloc>(context)
              .add(const AddButtonPressedEvent());
          // .add(const LoadData());
        },
        child: const Text(
          "Add",
          style: TextStyle(
              color: AppTheme.lightColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );

  }
}
