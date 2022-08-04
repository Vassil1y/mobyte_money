import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobyte_money/Auth_full/presentation/pages/page_with_logic.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobyte_money/Auth_full/bloc/auth_bloc.dart';
import 'package:mobyte_money/Auth_full/presentation/auth_theme.dart';
import 'package:mobyte_money/Auth_full/presentation/widgets/return_button.dart';
import 'package:mobyte_money/Auth_full/presentation/widgets/textfields/password_text_field.dart';
import 'package:mobyte_money/Auth_full/presentation/pages/log_in_page.dart';

class CreatePasswordPage extends HookWidget {
  const CreatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = useTextEditingController();
    final repeatController = useTextEditingController();

    return Stack(
      children: [
        PageWithLogic(
          onSuccess: () {Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const LogInPage()), (route) => false);},
          onPop: () async {Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const LogInPage()), (route) => false); return false;},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ReturnButton(),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Create Password",
                                style: AuthTheme.headerText)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Create your new password to login",
                                style: AuthTheme.bodyText)),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  PasswordTextField(
                      hint: "Password", controller: passwordController,
                  ),
                  SizedBox(height: 3.h),
                  PasswordTextField(
                      hint: "Create password",
                      controller: repeatController,
                      pred: (s) {
                        return s == passwordController.text;
                      },
                      message: "Passwords do not match"),
                  SizedBox(height: 3.h),
                  ElevatedButton(
                      onPressed: () {BlocProvider.of<AuthBloc>(context).add(const DummyEvent());},
                      style: AuthTheme.darkButtonStyle,
                      child: const Text("Register")),
                  SizedBox(height: 20.h),
                ]),
          ),
        ),
        const Center(
          child: Text("ЗАГЛУШКА", style: TextStyle(color: Colors.red,fontSize: 30),),
        )
      ],
    );
  }
}
