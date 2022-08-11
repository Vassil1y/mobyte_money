import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_money/money_part/presentation/pages/navigation_bar_pages/account_page.dart';

part 'navigation_bar_event.dart';

part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc()
      : super(
          const NavigationBarState(
            child: AccountPage(),
          ),
        ) {
    on<NavigationBarEvent>((event, emit) async {
      emit(
        NavigationBarState(child: event.child),
      );
    });
  }
}
