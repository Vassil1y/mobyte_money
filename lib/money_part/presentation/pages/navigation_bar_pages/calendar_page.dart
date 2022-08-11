import 'package:flutter/material.dart';
import 'package:mobyte_money/debug_data.dart';
import 'package:mobyte_money/money_part/presentation/pages/transactions/transaction_card.dart';
import 'package:mobyte_money/static_data/theme.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({Key? key}) : super(key: key);

  final PageController controller = PageController(initialPage: 0);
  int current_page_index = 0;

  void rightToPage() {
    if (current_page_index != 3) {
      controller.animateToPage(
        ++current_page_index,
        curve: Curves.linear,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  void leftToPage() {
    if (current_page_index != 0) {
      controller.animateToPage(
        --current_page_index,
        curve: Curves.linear,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.6, 1],
                  colors: [AppTheme.mainColor, AppTheme.subColor])),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        leftToPage();
                      },
                      icon: const Icon(Icons.chevron_left),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 4, left: 4),
                      width: 80,
                      height: 60,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: controller,
                        onPageChanged: (k) {},
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: const Text("data"),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Text("data"),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Text("data"),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Text("data"),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        rightToPage();
                      },
                      icon: const Icon(Icons.chevron_right),
                    ),
                  ],
                ),
                Text("data"),
                Text("data")
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 40),
          height: 120,
          child: ListView(scrollDirection: Axis.horizontal, children: kk),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const Divider(
                  thickness: 3,
                ),
                Flexible(
                  child: ListView(
                    children: const [
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                      TransactionCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
