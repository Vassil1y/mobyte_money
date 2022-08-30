import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../static_data/theme.dart';
import '../../../../../bloc/transaction_page_bloc/transaction_page_bloc.dart';

class TransactionPageAppbar extends StatelessWidget {
  const TransactionPageAppbar({Key? key, required this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.backColor,
        title: Text(
          title,
          style: const TextStyle(color: AppTheme.textColor),
        ),
        leading: Container(
          margin: const EdgeInsets.all(5),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: AppTheme.mainColor.withOpacity(0.5),
            child: IconButton(
              onPressed: () {
                BlocProvider.of<TransactionBloc>(context).add(
                    const ClearDataEvent());
                BlocProvider.of<TransactionBloc>(context)
                    .add(const FetchEvent(date: "2022-08-12" ));
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
        ));
  }
}
