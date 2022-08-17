import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_money/auth_part/bloc/auth_bloc.dart';
import 'package:mobyte_money/auth_part/presentation/pages/log_in_page.dart';
import 'package:mobyte_money/auth_part/presentation/pages/page_with_logic.dart';
import 'package:mobyte_money/static_data/theme.dart';
import 'package:sizer/sizer.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  final instance = FirebaseAuth.instance;
  final storeInstance = FirebaseFirestore.instance;
  late String email;

  Future<String> kk() async {
    var data = await storeInstance.collection('users').doc(email).get();
    return username = await data.get("username");
  }

  late String username;

  @override
  Widget build(BuildContext context) {
    email = instance.currentUser?.email == null
        ? "Email"
        : (instance.currentUser?.email)!;

    return PageWithLogic(
      onPop: () async {
        return false;
      },
      onSuccess: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LogInPage()),
            (route) => false);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h),
            Image.asset(
              "assets/mobyte_logo.png",
              width: 21.25.h,
            ),
            SizedBox(height: 3.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FutureBuilder(
                      future: kk(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Text(snapshot.data.toString(),
                              style: AppTheme.headerText);
                        }
                        return Text("Username", style: AppTheme.headerText);
                      }),
                  SizedBox(height: 5.h),
                  Text(email, style: AppTheme.headerText),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(const LogOutEvent());
                },
                style: AppTheme.darkButtonStyle,
                child: const Text("Logout")),
          ],
        ),
      ),
    );
  }
}
