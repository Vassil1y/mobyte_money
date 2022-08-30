import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_money/static_data/theme.dart';

import '../../../../../bloc/transaction_page_bloc/transaction_page_bloc.dart';

class DescriptionButton extends StatelessWidget {
  const DescriptionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 64),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.topLeft,
          child: TextField(
            style: const TextStyle(color: AppTheme.mainColor),
            controller: controller,
            onSubmitted: (value) {
              BlocProvider.of<TransactionBloc>(context)
                  .add(ChangeDescriptionFieldEvent(description: value));
            },
            minLines: 5,
            maxLines: 5,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Description",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
