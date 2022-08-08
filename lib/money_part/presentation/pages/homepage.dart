import 'package:flutter/material.dart';
import 'package:mobyte_money/static_data/theme.dart';
import 'package:mobyte_money/money_part/presentation/pages/navigation_bar_pages/account_page.dart';
import 'package:mobyte_money/money_part/presentation/pages/navigation_bar_pages/calendar_page.dart';
import 'package:mobyte_money/money_part/presentation/pages/navigation_bar_pages/graph_page.dart';
import 'package:mobyte_money/money_part/presentation/pages/navigation_bar_pages/wallet_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final pages = [GraphPage(), CalendarPage(), WalletPage(), AccountPage()];
  int index = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[index],
        floatingActionButton: FloatingActionButton(
          backgroundColor: AuthTheme.mainColor,
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: AuthTheme.mainColor,
          shape: CircularNotchedRectangle(),
          notchMargin: 6,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                ),
                Text(""),
                IconButton(
                  icon: Icon(
                    Icons.account_balance_wallet,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      index = 3;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
