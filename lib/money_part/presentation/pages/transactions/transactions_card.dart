import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.add),
            Column(
              children: [Text("Salaries mg.", style: TextStyle(fontSize: 18),), Text("data")],
            ),
          ],
        ),
        Row(
          children: [
            Text("data"),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.chevron_right),
            )
          ],
        )


      ],
    );
  }
}
