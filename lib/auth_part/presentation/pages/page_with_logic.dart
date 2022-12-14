import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobyte_money/auth_part/bloc/auth_bloc.dart';
import 'package:mobyte_money/static_data/theme.dart';
import 'package:sizer/sizer.dart';

class PageWithLogic extends HookWidget {
  const PageWithLogic(
      {super.key,
      required this.onSuccess,
      required this.onPop,
      required this.child});

  final void Function() onSuccess;
  final Future<bool> Function() onPop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthFail) {
          await Flushbar(
            message: state.message,
            duration: const Duration(seconds: 3),
            isDismissible: true,
            dismissDirection: FlushbarDismissDirection.VERTICAL,
            backgroundColor: AppTheme.errorColor,
          ).show(context);
        } else if (state is AuthSuccess) {
          onSuccess();
        }
      },
      child: WillPopScope(
        onWillPop: onPop,
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: 100.w,
              child: BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (previous, current) {
                  if (previous is AuthLoading || current is AuthLoading) {
                    return true;
                  }

                  return false;
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return SizedBox(
                      height: 100.h,
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 4,
                          color: AppTheme.mainColor,
                        ),
                      ),
                    );
                  } else {
                    return child;
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
