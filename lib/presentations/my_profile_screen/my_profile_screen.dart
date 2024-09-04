import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fund_management_app/core/utils/image_constant.dart';

import 'package:fund_management_app/presentations/common/custom_clipper.dart';

import 'package:fund_management_app/theme/theme_helper.dart';
import 'package:fund_management_app/widgets/custom_image_view.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  static const routeName = '/user-profile-screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: CircularEdgeCustomClipper(),
                child: Container(
                  color: appTheme.primary,
                  height: MediaQuery.of(context).size.height * 0.26,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 15,
                          child: IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: appTheme.white,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "My Profile",
                            style: textTheme.bodyLarge!.copyWith(
                              color: appTheme.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          right: 15,
                          child: CustomImageView(
                            alignment: Alignment.center,
                            height: 31,
                            width: 31,
                            imagePath: ImageConstant.notification,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -100,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 132,
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            shape: BoxShape.circle,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.user,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      heightFactor: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "John Doe",
                            style: textTheme.bodyMedium!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "johndoe@gmail.com",
                            style: textTheme.bodySmall!.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: appTheme.gray),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: appTheme.primary,
                        width: 4,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        height: 25,
                        width: 25,
                        imagePath: ImageConstant.account,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Account Information",
                        style: textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: appTheme.primary,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: appTheme.primary,
                        width: 4,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        height: 25,
                        width: 25,
                        imagePath: ImageConstant.settings,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Settings",
                        style: textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: appTheme.primary,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: appTheme.primary,
                        width: 4,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        height: 25,
                        width: 25,
                        imagePath: ImageConstant.discount,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "My Offers",
                        style: textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: appTheme.primary,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: appTheme.primary,
                        width: 4,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        height: 25,
                        width: 25,
                        imagePath: ImageConstant.qrCodeIcon,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "My QR Code",
                        style: textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: appTheme.primary,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showCustomDialog(context);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: appTheme.primary,
                        width: 4,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        height: 25,
                        width: 25,
                        imagePath: ImageConstant.logoutRounded,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Logout",
                        style: textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: appTheme.primary,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: const Color.fromARGB(103, 53, 52, 52).withOpacity(0.5),
      builder: (BuildContext context) {
        return Stack(children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Color.fromARGB(0, 241, 237, 237)
                  .withOpacity(0), // Make it transparent
            ),
          ),
          Dialog(
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(20),
            // ),

            backgroundColor: appTheme.primary,
            child: Container(
              // height: 209,
              width: 285,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: appTheme.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Are you sure?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Are you sure to log out from this account?',
                    style: textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                          height: 26,
                          width: 82,
                          decoration: BoxDecoration(
                            color: appTheme.primary,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: textTheme.bodySmall!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                          height: 26,
                          width: 82,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "Logout",
                              style: textTheme.bodySmall!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]);
      },
    );
  }
}
