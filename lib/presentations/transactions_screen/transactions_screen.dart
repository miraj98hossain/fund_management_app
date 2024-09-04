import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_management_app/core/utils/date_time_extension.dart';
import 'package:fund_management_app/presentations/home_screen/bloc/transaction_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fund_management_app/core/utils/image_constant.dart';
import 'package:fund_management_app/presentations/home_screen/home_screen.dart';
import 'package:fund_management_app/theme/theme_helper.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  static const String routeName = '/transactions-screen';

  @override
  Widget build(BuildContext context) {
    return const TransactionsScreenBody();
  }
}

class TransactionsScreenBody extends StatefulWidget {
  const TransactionsScreenBody({super.key});

  @override
  State<TransactionsScreenBody> createState() => _TransactionsScreenBodyState();
}

class _TransactionsScreenBodyState extends State<TransactionsScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: appTheme.primary,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Transactions",
            style: textTheme.bodyLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionLoaded) {
                    return ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        ...List.generate(
                          state.transactions.length,
                          (index) {
                            return TransactionsItemWidgets(
                              icon: state.transactions[index].type == "transfer"
                                  ? ImageConstant.sendIcon
                                  : ImageConstant.checkBookIcon,
                              name: state.transactions[index].accountNumber,
                              date: state.transactions[index].date
                                  .toFormattedString(),
                              ammount:
                                  state.transactions[index].amount.toString(),
                              transectiontype: Text(
                                state.transactions[index].type.toUpperCase(),
                                style: textTheme.bodySmall!.copyWith(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: state.transactions[index].type ==
                                          "transfer"
                                      ? appTheme.red
                                      : state.transactions[index].type ==
                                              "deposit"
                                          ? appTheme.green
                                          : appTheme.gray,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
