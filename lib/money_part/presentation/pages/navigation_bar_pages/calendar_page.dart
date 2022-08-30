import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_money/money_part/bloc/transaction_page_bloc/transaction_page_bloc.dart';
import 'package:mobyte_money/static_data/static_strings.dart';
import 'package:mobyte_money/static_data/theme.dart';

import '../../../../debug_data.dart';
import '../widgets/card_of_money.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({Key? key}) : super(key: key);

  final PageController controller = PageController(initialPage: 0);

  int current_page_index = 0;
  final List<Container> z = [];
  int sum = 0;

  List<CardOfMoney> moneyCard(){
    List<CardOfMoney> temp = [];
    for(int i = 0; i<categoriesList.length;i++){
      temp.add(CardOfMoney(backgroundColor: categoryColors[i], text: categoriesList[i],));
    }
    return temp;
  }

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
     BlocProvider.of<TransactionBloc>(context).add(const FetchEvent());
    void rofl() {
      BlocProvider.of<TransactionBloc>(context)
          .add(const ChangeTypeButtonColorToTrueEvent());
    }
    List<Container> asdas() {
      List<Container> kk = [];
      months.forEach((element) {
        kk.add(Container(
          alignment: Alignment.center,
          child: Text(element),
        ));
      });
      return kk;
    }

    return BlocBuilder<TransactionBloc, TransactionState>(

        buildWhen: (previous, current) {
      if (current is FetchState) {

        return true;
      } else {
        return false;
      }
    }, builder: (context, state) {
      if (state is FetchState) {
        if(z.isNotEmpty){z.clear();sum=0;}
        for (var element in state.transactionsList) {
          print(element.date + sum.toString());
          sum+=element.amount;

          z.add(Container(
            color: Colors.grey,
            height: 100,
            child: Text(element.date),
          ));

        }
        print("asdasdasdasd");
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
                            children: asdas(),
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
                    Text(sum>0 ? "Profit" : "Loss"),
                    Text("${rub}$sum", style: TextStyle(color: AppTheme.lightColor),)
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 40),
              height: 120,
              child: ListView(scrollDirection: Axis.horizontal, children: moneyCard()),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Divider(
                      thickness: 3,
                    ),
                    // BlocBuilder(builder: builder)
                    Flexible(
                        child: ListView(
                      children: z,
                    )),

                    // StreamBuilder(
                    //     stream: FirebaseFirestore.instance
                    //         .collection("transactions")
                    //         .doc((FirebaseAuth.instance.currentUser?.email)!
                    //         .toString())
                    //         .collection("transactions")
                    //         .snapshots(),
                    //     builder: (BuildContext context,
                    //         AsyncSnapshot<QuerySnapshot> snapshot) {
                    //       if (!snapshot.hasData) {
                    //         return const Center(
                    //           child: CircularProgressIndicator(),
                    //         );
                    //       }
                    //
                    //       return Flexible(
                    //         child: ListView(
                    //           children: snapshot.data!.docs.map((document) {
                    //             return Container(
                    //               child: Text("Title: " + document['data']),
                    //             );
                    //           }).toList(),
                    //         ),
                    //       );
                    //     }),
                  ],
                ),
              ),
            ),
          ],
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
