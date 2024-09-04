import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fund_management_app/core/utils/image_constant.dart';
import 'package:fund_management_app/presentations/home_screen/home_screen.dart';
import 'package:fund_management_app/theme/theme_helper.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  static const String routeName = '/transactions-screen';

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
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
