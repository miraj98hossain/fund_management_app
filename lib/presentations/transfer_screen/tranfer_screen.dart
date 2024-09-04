import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_management_app/presentations/common/common_text_field_widgets.dart';
import 'package:fund_management_app/presentations/home_screen/bloc/transaction_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:fund_management_app/theme/theme_helper.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  static const String routeName = '/transfer-screen';

  @override
  Widget build(BuildContext context) {
    return const TranferScreenBody();
  }
}

class TranferScreenBody extends StatefulWidget {
  const TranferScreenBody({super.key});

  @override
  State<TranferScreenBody> createState() => _TranferScreenBodyState();
}

class _TranferScreenBodyState extends State<TranferScreenBody> {
  TextEditingController accNumController = TextEditingController();
  FocusNode accNumFocusNode = FocusNode();
  TextEditingController amountController = TextEditingController();
  FocusNode amountFocusNode = FocusNode();
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
            "Transfer",
            style: textTheme.bodyLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account Number",
                    style: textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CommonTextFieldWidget(
                    hintText: "Enter Account Number",
                    controller: accNumController,
                    focusNode: accNumFocusNode,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Amount",
                    style: textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CommonTextFieldWidget(
                    hintText: "Enter Amount",
                    controller: amountController,
                    focusNode: amountFocusNode,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BlocConsumer<TransactionBloc, TransactionState>(
                listener: (context, state) {
                  if (state is TransactionLoaded) {
                    accNumController.clear();
                    amountController.clear();
                    accNumFocusNode.unfocus();
                    amountFocusNode.unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Transferred Successfully",
                          style: textTheme.bodySmall!.copyWith(
                              color: appTheme.white,
                              fontWeight: FontWeight.w400),
                        ),
                        backgroundColor: appTheme.primary,
                      ),
                    );
                  }
                  if (state is TransactionError) {
                    accNumController.clear();
                    amountController.clear();
                    accNumFocusNode.unfocus();
                    amountFocusNode.unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.error.toString(),
                          style: textTheme.bodySmall!.copyWith(
                              color: appTheme.white,
                              fontWeight: FontWeight.w400),
                        ),
                        backgroundColor: appTheme.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<TransactionBloc>().add(
                            Tranfer(
                              amount: num.parse(amountController.text),
                              accountNo: accNumController.text,
                            ),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appTheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                    ),
                    child: Text(
                      state is TransactionLoading
                          ? "Transfering..."
                          : "Transfer Money",
                      style: textTheme.bodySmall!.copyWith(
                        color: appTheme.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
