import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fund_management_app/core/utils/image_constant.dart';
import 'package:fund_management_app/presentations/landing_screen/landing_screen.dart';
import 'package:fund_management_app/theme/theme_helper.dart';
import 'package:fund_management_app/widgets/custom_image_view.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
              onPressed: () {
                context.pushReplacement(LandingScreen.routeName);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: appTheme.primary,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Overview",
            style: textTheme.bodyLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: appTheme.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "7 Days",
                        style: textTheme.bodySmall!.copyWith(
                          color: appTheme.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: appTheme.primary, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "1 Month",
                        style: textTheme.bodySmall!.copyWith(
                          color: appTheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: appTheme.primary, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "3 Months",
                        style: textTheme.bodySmall!.copyWith(
                          color: appTheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: appTheme.primary, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "1 Year",
                        style: textTheme.bodySmall!.copyWith(
                          color: appTheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 55,
              ),
              CustomImageView(
                height: 176,
                width: 176,
                imagePath: ImageConstant.piChar,
              ),
              const SizedBox(
                height: 45,
              ),
              Text(
                "Expense Details",
                style: textTheme.bodyMedium!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: appTheme.primary, width: 4),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      height: 25,
                      width: 25,
                      imagePath: ImageConstant.shoppingCart,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Shopping",
                      style: textTheme.bodySmall!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "USD 400",
                      style: textTheme.bodySmall!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: appTheme.primary, width: 4),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      height: 25,
                      width: 25,
                      imagePath: ImageConstant.caricon,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Transportation",
                      style: textTheme.bodySmall!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "USD 250",
                      style: textTheme.bodySmall!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: appTheme.primary, width: 4),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      height: 25,
                      width: 25,
                      imagePath: ImageConstant.groceries,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Groceries",
                      style: textTheme.bodySmall!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "USD 250",
                      style: textTheme.bodySmall!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: appTheme.primary, width: 4),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      height: 25,
                      width: 25,
                      imagePath: ImageConstant.utilities,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Utilities",
                      style: textTheme.bodySmall!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "USD 100",
                      style: textTheme.bodySmall!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
