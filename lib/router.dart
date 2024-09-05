import 'package:fund_management_app/presentations/home_screen/home_screen.dart';

import 'package:fund_management_app/presentations/sign_in_screen/sign_in_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:fund_management_app/presentations/deposite_screen/deposite_screen.dart';

import 'package:fund_management_app/presentations/transactions_screen/transactions_screen.dart';
import 'package:fund_management_app/presentations/transfer_screen/tranfer_screen.dart';
import 'package:fund_management_app/presentations/my_profile_screen/my_profile_screen.dart';
import 'package:fund_management_app/presentations/withdraw_screen/withdraw_screen.dart';

final router = GoRouter(
  initialLocation: SignInScreen.routeName,
  routes: [
    GoRoute(
      path: SignInScreen.routeName,
      name: SignInScreen.routeName,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: HomeScreen.routeName,
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: DepositeScreen.routeName,
      name: DepositeScreen.routeName,
      builder: (context, state) => const DepositeScreen(),
    ),
    GoRoute(
      path: TransferScreen.routeName,
      name: TransferScreen.routeName,
      builder: (context, state) => const TransferScreen(),
    ),
    GoRoute(
      path: WithdrawScreen.routeName,
      name: WithdrawScreen.routeName,
      builder: (context, state) => const WithdrawScreen(),
    ),
    GoRoute(
      path: TransactionsScreen.routeName,
      name: TransactionsScreen.routeName,
      builder: (context, state) => const TransactionsScreen(),
    ),
    GoRoute(
      path: MyProfileScreen.routeName,
      name: MyProfileScreen.routeName,
      builder: (context, state) => const MyProfileScreen(),
    ),
  ],
);
