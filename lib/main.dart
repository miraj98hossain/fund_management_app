import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_management_app/presentations/home_screen/bloc/transaction_bloc.dart';

import 'package:fund_management_app/router.dart';
import 'package:fund_management_app/theme/theme_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc(),
      child: MaterialApp.router(
        title: 'Fund Management App',
        theme: theme,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
