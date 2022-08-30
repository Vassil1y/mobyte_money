import 'package:flutter/material.dart';
import 'package:mobyte_money/money_part/presentation/pages/classes/transaction_class.dart';

class MainHorisontalList extends StatelessWidget {
  MainHorisontalList({Key? key, required this.transactionsList})
      : super(key: key);
  final List<TransactionClass> transactionsList;
  final List<Container> z = [];

  @override
  Widget build(BuildContext context) {
    for (var element in transactionsList) {
      print(element.date);
      z.add(Container(
        color: Colors.grey,
        height: 100,
        child: Text(element.date),
      ));
    }
    return Flexible(child: ListView(children: z));
  }
//   return  ListView.builder(
//       itemCount:state.,
//       itemBuilder: (BuildContext context, int index) {}),
// }
}
