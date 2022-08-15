import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_money/money_part/presentation/pages/widgets/transaction_widgets/transaction_page_button.dart';

import '../../../../../static_data/static_strings.dart';
import '../../../../../static_data/theme.dart';
import '../../../../bloc/transaction_page_bloc/transaction_page_bloc.dart';

class StatusButtons extends StatelessWidget {
  const StatusButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void statusChangeToTrue() {
      BlocProvider.of<TransactionBloc>(context)
          .add(const ChangeStatusButtonColorToTrueEvent());
    }

    void statusChangeToFalse() {
      BlocProvider.of<TransactionBloc>(context)
          .add(const ChangeStatusButtonColorToFalseEvent());
    }
    return Column(
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
                if (current is ChangeStatusButtonColorToTrueState ||
                    current
                    is ChangeStatusButtonColorToFalseState) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                if (state is ChangeStatusButtonColorToTrueState) {
                  return TransactionPageButton(
                    backgroundColor:
                    AppTheme.mainColor.withOpacity(0.3),
                    text: transactionStatusOk,
                    clickFunction: statusChangeToTrue,
                  );
                } else if (state
                is ChangeStatusButtonColorToFalseState) {
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
                if (current is ChangeStatusButtonColorToTrueState ||
                    current
                    is ChangeStatusButtonColorToFalseState) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                if (state is ChangeStatusButtonColorToTrueState) {
                  return TransactionPageButton(
                    backgroundColor: AppTheme.lightColor,
                    text: transactionStatusWait,
                    clickFunction: statusChangeToFalse,
                  );
                } else if (state
                is ChangeStatusButtonColorToFalseState) {
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
          ],
        )
      ],
    );
  }
}
