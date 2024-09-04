import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fund_management_app/theme/theme_helper.dart';

class DepositeScreen extends StatelessWidget {
  const DepositeScreen({super.key});

  static const String routeName = '/deposite-screen';

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
            "Deposite",
            style: textTheme.bodyLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Text(
              "Set Ammount",
              style: textTheme.bodyMedium!.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(235, 235, 235, 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.remove,
                    color: appTheme.black900,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text("\$500.00",
                    style: textTheme.bodyMedium!
                        .copyWith(fontSize: 40, fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(235, 235, 235, 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.add,
                    color: appTheme.black900,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {},
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
                "Deposite Money",
                style: textTheme.bodySmall!.copyWith(
                  color: appTheme.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
