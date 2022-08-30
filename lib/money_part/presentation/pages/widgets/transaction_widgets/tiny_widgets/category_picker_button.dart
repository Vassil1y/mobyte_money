import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_money/static_data/theme.dart';

import '../../../../../../static_data/static_strings.dart';
import '../../../../../bloc/transaction_page_bloc/transaction_page_bloc.dart';
class CategoryPickerButton extends StatelessWidget {
  CategoryPickerButton({Key? key}) : super(key: key);

  List<PopupMenuItem> sk(List<String> k) {
    final List<PopupMenuItem> l = [];
    k.forEach((element) {
      l.add(PopupMenuItem(
          value: element,
          child: Container(
            child: Text(element),
          )));
    });
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width, 64),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      onPressed: () {},
      child: PopupMenuButton(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 64,
            child: Align(
              alignment: Alignment.centerLeft,
              child: BlocBuilder<TransactionBloc, TransactionState>(
                  buildWhen: (previous, current) {
                if (current is ChangeCategoryFieldState) {
                  return true;
                } else {
                  return false;
                }
              }, builder: (context, state) {
                if (state is ChangeCategoryFieldState) {
                  return Text(
                    state.category,
                    style: const TextStyle(color: AppTheme.mainColor),
                  );
                } else {
                  return const Text(
                    "Category",
                    style: TextStyle(color: Colors.grey),
                  );
                }
              }),
            ),
          ),
          itemBuilder: (BuildContext context) => sk(categoriesList),
          onSelected: (category) {
            BlocProvider.of<TransactionBloc>(context)
                .add(ChangeCategoryFieldEvent(category: category.toString()));
          }

          // hint: const Padding(
          //   padding: EdgeInsets.only(left: 5),
          //   child: Text(
          //     categoryString,
          //     style: TextStyle(color: Colors.grey),
          //   ),
          // ),
          // isExpanded: true,
          // items: items,
          // onChanged: (k) {},
          // underline: Container(),
          ),
    );
  }
}
