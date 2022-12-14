import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobyte_money/auth_part/presentation/pages/create_password_page.dart';
import 'package:sizer/sizer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobyte_money/auth_part/bloc/auth_bloc.dart';
import 'package:mobyte_money/auth_part/presentation/widgets/return_button.dart';
import 'package:mobyte_money/static_data/theme.dart';
import 'package:mobyte_money/auth_part/presentation/pages/page_with_logic.dart';

import 'package:mobyte_money/auth_part/presentation/pages/log_in_page.dart';

class VerificationPage extends HookWidget {
  const VerificationPage({super.key});


  @override
  Widget build(BuildContext context) {
    final pinController = useTextEditingController();

    return Stack(
      children: [
        PageWithLogic(
          onSuccess: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const CreatePasswordPage()),(_)=>false);},
          onPop: () async {Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const LogInPage()), (route) => false); return false;},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ReturnButton(),
                  SizedBox(height: 10.h,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Enter Verification Code", style: AppTheme.headerText)
                        ),
                        Text("Enter code that we have sent to your email", style: AppTheme.bodyText),
                      ],
                    ),
                  ),


                  SizedBox(height: 4.h),

                  PinCodeTextField(
                      appContext: context,
                      length: 4,
                      controller: pinController,
                      onChanged: (s){},
                      keyboardType: TextInputType.number,
                      obscureText: true,

                      pinTheme: PinTheme(
                        activeColor: AppTheme.textColor,
                        selectedColor: AppTheme.mainColor,
                        inactiveColor: AppTheme.textColor.withOpacity(0.5),

                        fieldHeight: 8.h,
                        fieldWidth: 8.h,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                      ),
                  ),

                  SizedBox(height: 4.h),

                  ElevatedButton(onPressed: (){BlocProvider.of<AuthBloc>(context).add(const DummyEvent());}, style: AppTheme.darkButtonStyle, child: const Text("Reset my password")),

                  TextButton(onPressed: (){}, style: TextButton.styleFrom(textStyle: const TextStyle(color: AppTheme.mainColor)), child: const Text("Resend code")),
                  SizedBox(height: 20.h),
                ]
            ),
          ),
        ),

        const Center(
          child: Text("????????????????", style: TextStyle(color: Colors.red,fontSize: 30),),
        )
      ],
    );
  }
}
