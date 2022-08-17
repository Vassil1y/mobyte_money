import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobyte_money/auth_part/bloc/auth_bloc.dart';
import 'package:mobyte_money/auth_part/data/auth_repository.dart';
import 'package:mobyte_money/auth_part/data/firebase_repository.dart';
import 'package:mobyte_money/auth_part/presentation/pages/log_in_page.dart';
import 'package:mobyte_money/money_part/bloc/navigation_bar_bloc/navigation_bar_bloc.dart';
import 'package:mobyte_money/money_part/presentation/pages/homepage.dart';
import 'package:mobyte_money/static_data/theme.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthRepository>(
      lazy: false,
      create: (context) => FirebaseRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(RepositoryProvider.of<AuthRepository>(context)),
          ),
          BlocProvider(create: (context) => NavigationBarBloc()),
        ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Mobyte auth',
            theme: AppTheme.theme,
            home: FirebaseAuth.instance.currentUser == null
                ? const LogInPage()
                : const Homepage(),
          );
        }),
      ),
    );
  }
}
