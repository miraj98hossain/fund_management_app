import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_management_app/presentations/home_screen/bloc/transaction_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fund_management_app/core/utils/image_constant.dart';
import 'package:fund_management_app/presentations/deposite_screen/deposite_screen.dart';

import 'package:fund_management_app/presentations/transactions_screen/transactions_screen.dart';
import 'package:fund_management_app/presentations/transfer_screen/tranfer_screen.dart';
import 'package:fund_management_app/presentations/my_profile_screen/my_profile_screen.dart';
import 'package:fund_management_app/presentations/withdraw_screen/withdraw_screen.dart';
import 'package:fund_management_app/theme/theme_helper.dart';
import 'package:fund_management_app/widgets/custom_image_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/homeScreen';
  @override
  Widget build(BuildContext context) {
    return const HomeScreenBody();
  }
}

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  num transactionsBalance = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          if (state is TransactionInitial) {
            transactionsBalance = state.transactionsBalance;
          }
          if (state is TransactionLoaded) {
            transactionsBalance = state.transactionsBalance;
          }
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: appTheme.primary,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize
                                .min, // Makes column take minimum space required
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good Morning",
                                style: textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: appTheme.white,
                                ),
                              ),
                              Text(
                                "Mr. John Doe",
                                style: textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: appTheme.white,
                                ),
                              ),
                              Text(
                                "Balance",
                                style: textTheme.bodyMedium!.copyWith(
                                  fontSize: 15,
                                  color: appTheme.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                "$transactionsBalance TK.",
                                style: textTheme.bodyMedium!.copyWith(
                                  fontSize: 15,
                                  color: appTheme.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(MyProfileScreen.routeName);
                            },
                            child: Container(
                              height: 44,
                              width: 44,
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(138, 255, 248, 1),
                              ),
                              alignment: Alignment.center,
                              child: CustomImageView(
                                  imagePath: ImageConstant.user),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(DepositeScreen.routeName);
                            },
                            child: Container(
                              height: 90,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: appTheme.secondary),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                    height: 40,
                                    width: 40,
                                    imagePath: ImageConstant.requestMoney,
                                  ),
                                  Text(
                                    "Deposit",
                                    style: textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: appTheme.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(TransferScreen.routeName);
                            },
                            child: Container(
                              height: 90,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: appTheme.secondary),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                    height: 40,
                                    width: 40,
                                    imagePath: ImageConstant.dataTransfer,
                                  ),
                                  Text(
                                    "Transfer",
                                    style: textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: appTheme.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(WithdrawScreen.routeName);
                            },
                            child: Container(
                              height: 90,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: appTheme.secondary),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                    height: 40,
                                    width: 40,
                                    imagePath: ImageConstant.checkBook,
                                  ),
                                  Text(
                                    "Withdraw",
                                    style: textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: appTheme.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Transactions",
                            style: textTheme.bodyLarge!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(TransactionsScreen.routeName);
                            },
                            child: Text(
                              "See all",
                              style: textTheme.bodyLarge!.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TransactionsItemWidgets(
                      icon: ImageConstant.sendIcon,
                      name: "To Devid Malan",
                      date: "June 13, 2023",
                      ammount: "-\$290.00",
                      transectiontype: Text(
                        "Sent",
                        style: textTheme.bodySmall!.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: appTheme.red,
                        ),
                      ),
                    ),
                    TransactionsItemWidgets(
                      icon: ImageConstant.checkBookIcon,
                      name: "To Royal Bank Ltd.",
                      date: "May 12, 2023",
                      ammount: "-€1200.00",
                      transectiontype: Text(
                        "Withdrawn",
                        style: textTheme.bodySmall!.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: appTheme.gray,
                        ),
                      ),
                    ),
                    TransactionsItemWidgets(
                      icon: ImageConstant.checkBookIcon,
                      name: "From Joe Root",
                      date: "January 1, 2023",
                      ammount: "C€200.00",
                      transectiontype: Text(
                        "Received",
                        style: textTheme.bodySmall!.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: appTheme.green,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class TransactionsItemWidgets extends StatelessWidget {
  const TransactionsItemWidgets({
    super.key,
    required this.name,
    required this.date,
    required this.ammount,
    required this.transectiontype,
    required this.icon,
  });
  final String name;
  final String date;
  final String ammount;
  final Text transectiontype;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: CustomImageView(
              height: 15,
              width: 15,
              imagePath: icon,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: textTheme.bodySmall!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Text(
                date,
                style: textTheme.bodySmall!.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: appTheme.gray,
                ),
              )
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    ammount,
                    style: textTheme.bodySmall!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              transectiontype,
            ],
          ),
        ],
      ),
    );
  }
}
