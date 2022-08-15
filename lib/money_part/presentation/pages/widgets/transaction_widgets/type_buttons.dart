import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_money/money_part/presentation/pages/widgets/transaction_widgets/transaction_page_button.dart';

import '../../../../../static_data/static_strings.dart';
import '../../../../../static_data/theme.dart';
import '../../../../bloc/transaction_page_bloc/transaction_page_bloc.dart';

class TypeButtons extends StatelessWidget {
  const TypeButtons({Key? key}) : super(key: key);

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

    return Column(
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
                if (current is ChangeTypeButtonColorToTrueState ||
                    current is ChangeTypeButtonColorToFalseState) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                if (state is ChangeTypeButtonColorToTrueState) {
                  return TransactionPageButton(
                    backgroundColor: AppTheme.mainColor.withOpacity(0.3),
                    text: profit,
                    clickFunction: typeChangeToTrue,
                  );
                } else if (state is ChangeTypeButtonColorToFalseState) {
                  return TransactionPageButton(
                    backgroundColor: AppTheme.lightColor,
                    text: profit,
                    clickFunction: typeChangeToTrue,
                  );
                } else {
                  return TransactionPageButton(
                    backgroundColor: AppTheme.mainColor.withOpacity(0.3),
                    text: profit,
                    clickFunction: typeChangeToTrue,
                  );
                }
              },
            ),
            BlocBuilder<TransactionBloc, TransactionState>(
              buildWhen: (previous, current) {
                if (current is ChangeTypeButtonColorToTrueState ||
                    current is ChangeTypeButtonColorToFalseState) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                if (state is ChangeTypeButtonColorToTrueState) {
                  return TransactionPageButton(
                    backgroundColor: AppTheme.lightColor,
                    text: loss,
                    clickFunction: typeChangeToFalse,
                  );
                } else if (state is ChangeTypeButtonColorToFalseState) {
                  return TransactionPageButton(
                    backgroundColor: AppTheme.mainColor.withOpacity(0.3),
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
    );
  }
}
