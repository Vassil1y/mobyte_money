import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_money/money_part/bloc/navigation_bar_bloc/navigation_bar_bloc.dart';
import 'package:mobyte_money/money_part/presentation/pages/navigation_bar_pages/account_page.dart';
import 'package:mobyte_money/money_part/presentation/pages/navigation_bar_pages/calendar_page.dart';
import 'package:mobyte_money/money_part/presentation/pages/navigation_bar_pages/graph_page.dart';
import 'package:mobyte_money/money_part/presentation/pages/navigation_bar_pages/wallet_page.dart';
import 'package:mobyte_money/money_part/presentation/pages/transactions/add_transaction_page.dart';
import 'package:mobyte_money/static_data/theme.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppTheme.backColor,
        body: BlocBuilder<NavigationBarBloc, NavigationBarState>(
          builder: (context, state) {
            return state;
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.mainColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Transaction()));
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: AppTheme.mainColor,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.home,
                    color: AppTheme.lightColor,
                  ),
                  onPressed: () {
                    BlocProvider.of<NavigationBarBloc>(context)
                        .add(const NavigationBarEvent(child: GraphPage()));
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.calendar_today,
                    color: AppTheme.lightColor,
                  ),
                  onPressed: () {
                    BlocProvider.of<NavigationBarBloc>(context)
                        .add(NavigationBarEvent(child: CalendarPage()));
                  },
                ),
                const Text(""),
                IconButton(
                  icon: const Icon(
                    Icons.account_balance_wallet,
                    color: AppTheme.lightColor,
                  ),
                  onPressed: () {
                    BlocProvider.of<NavigationBarBloc>(context)
                        .add(NavigationBarEvent(child: WalletPage()));
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.account_circle,
                    color: AppTheme.lightColor,
                  ),
                  onPressed: () {
                    BlocProvider.of<NavigationBarBloc>(context)
                        .add(NavigationBarEvent(child: AccountPage()));
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
