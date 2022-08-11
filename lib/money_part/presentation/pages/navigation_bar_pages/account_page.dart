import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobyte_money/auth_part/bloc/auth_bloc.dart';
import 'package:mobyte_money/static_data/theme.dart';
import 'package:mobyte_money/auth_part/presentation/pages/log_in_page.dart';
import 'package:mobyte_money/auth_part/presentation/pages/page_with_logic.dart';
import 'package:mobyte_money/auth_part/data/auth_repository.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithLogic(
      onPop: () async {return false;},
      onSuccess: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const LogInPage()), (route) => false);},
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h),

            Image.asset("assets/mobyte_logo.png", width: 21.25.h,),

            SizedBox(height: 3.h),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(RepositoryProvider.of<AuthRepository>(context).username, style: AppTheme.headerText),
                  SizedBox(height: 5.h),
                  Text(RepositoryProvider.of<AuthRepository>(context).userEmail, style: AppTheme.headerText),
                ],
              ),
            ),

            SizedBox(height: 5.h),
            ElevatedButton(onPressed: () {BlocProvider.of<AuthBloc>(context).add(const LogOutEvent());},
                style: AppTheme.darkButtonStyle,
                child: const Text("Logout")),
          ],
        ),
      ),
    );
  }
}


