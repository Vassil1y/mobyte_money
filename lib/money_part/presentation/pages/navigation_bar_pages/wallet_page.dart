import 'package:flutter/material.dart';

import '../../../../static_data/theme.dart';
import '../transactions/transaction_card.dart';
import '../widgets/card_of_money.dart';

class WalletPage extends StatelessWidget {
  WalletPage({Key? key}) : super(key: key);

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
                Text(
                  "₽dad",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text("data")
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 40),
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CardOfMoney(backgroundColor: Colors.amber),
              CardOfMoney(backgroundColor: Colors.red),
              CardOfMoney(backgroundColor: Colors.green),
              CardOfMoney(backgroundColor: Colors.green),
              CardOfMoney(backgroundColor: Colors.green),
            ],
          ),
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
                    children: [
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
