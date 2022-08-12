import 'package:flutter/material.dart';

import '../../../../static_data/theme.dart';

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
