import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobyte_money/auth_part/bloc/auth_bloc.dart';
import 'package:mobyte_money/auth_part/presentation/pages/page_with_logic.dart';
import 'package:mobyte_money/auth_part/presentation/widgets/return_button.dart';
import 'package:mobyte_money/auth_part/presentation/widgets/textfields/auth_text_field.dart';
import 'package:mobyte_money/auth_part/presentation/widgets/textfields/password_text_field.dart';
import 'package:mobyte_money/money_part/presentation/pages/homepage.dart';
import 'package:mobyte_money/static_data/theme.dart';
import 'package:sizer/sizer.dart';

import 'log_in_page.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({super.key});

  void _signUp(BuildContext context,
      {required String username,
      required String email,
      required String password}) {
    if (username == '') {
      BlocProvider.of<AuthBloc>(context)
          .add(const ErrorEvent(message: "Please, enter username"));
      return;
    }

    if (email == '') {
      BlocProvider.of<AuthBloc>(context)
          .add(const ErrorEvent(message: "Please, enter email"));
      return;
    }

    if (password == '') {
      BlocProvider.of<AuthBloc>(context)
          .add(const ErrorEvent(message: "Please, enter password"));
      return;
    }

    BlocProvider.of<AuthBloc>(context)
        .add(SignUpEvent(username: username, email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final repeatController = useTextEditingController();

    return PageWithLogic(
      onPop: () async {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LogInPage()),
            (route) => false);
        return false;
      },
      onSuccess: () {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => const Homepage()), (_) => false);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const ReturnButton(),
            SizedBox(height: 3.h),
            Image.asset(
              "assets/mobyte_logo.png",
              width: 21.25.h,
            ),
            SizedBox(height: 3.h),
            AuthTextField(
              hint: "Username",
              controller: usernameController,
            ),
            SizedBox(height: 3.h),
            AuthTextField(
              hint: "Email",
              controller: emailController,
            ),
            SizedBox(height: 3.h),
            PasswordTextField(
                hint: "Password",
                controller: passwordController,
                pred: (s) {
                  return RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$")
                      .hasMatch(s);
                },
                message: "At least 8 characters, one letter, one digit"),
            SizedBox(height: 3.h),
            PasswordTextField(
                hint: "Repeat password",
                controller: repeatController,
                pred: (s) {
                  return s == passwordController.text;
                },
                message: "Passwords do not match"),
            SizedBox(height: 3.h),
            ElevatedButton(
                onPressed: () {
                  _signUp(context,
                      username: usernameController.text,
                      email: emailController.text,
                      password: repeatController.text);
                },
                style: AppTheme.darkButtonStyle,
                child: const Text("Register")),
          ]),
        ),
      ),
    );
  }
}
