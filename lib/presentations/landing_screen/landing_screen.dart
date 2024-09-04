import 'package:flutter/material.dart';
import 'package:fund_management_app/core/utils/image_constant.dart';
import 'package:fund_management_app/presentations/banalce_screen/balance_screen.dart';

import 'package:fund_management_app/presentations/home_screen/home_screen.dart';
import 'package:fund_management_app/presentations/more_screen/more_screen.dart';
import 'package:fund_management_app/theme/theme_helper.dart';
import 'package:fund_management_app/widgets/custom_image_view.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});
  static const String routeName = '/landing-screen';
  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const BalanceScreen(),
    const MoreScreen(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        color: appTheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                    currentScreen = screens[selectedIndex];
                  });
                },
                child: Column(
                  children: [
                    CustomImageView(
                      height: 50,
                      width: 50,
                      imagePath: ImageConstant.homeIcon,
                    ),
                    Text(
                      "Home",
                      style: textTheme.labelSmall!.copyWith(
                        color: selectedIndex == 0
                            ? const Color.fromRGBO(138, 255, 248, 1)
                            : appTheme.white,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                    currentScreen = screens[selectedIndex];
                  });
                },
                child: Column(
                  children: [
                    CustomImageView(
                      height: 50,
                      width: 50,
                      imagePath: ImageConstant.balanceIcon,
                    ),
                    Text(
                      "Balance",
                      style: textTheme.labelSmall!.copyWith(
                        color: selectedIndex == 1
                            ? const Color.fromRGBO(138, 255, 248, 1)
                            : appTheme.white,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                    currentScreen = screens[selectedIndex];
                  });
                },
                child: Column(
                  children: [
                    CustomImageView(
                      height: 50,
                      width: 50,
                      imagePath: ImageConstant.menuIcon,
                    ),
                    Text(
                      "More",
                      style: textTheme.labelSmall!.copyWith(
                        color: selectedIndex == 2
                            ? const Color.fromRGBO(138, 255, 248, 1)
                            : appTheme.white,
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

class CircularNotchedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double notchRadius = 50.0; // Radius of the notch
    double cornerRadius = 30.0; // Radius of the top corners

    final Path path = Path();

    // Start from the top left
    path.moveTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0); // Top left corner
    path.lineTo(size.width / 2 - notchRadius, 0);
    path.arcToPoint(
      Offset(size.width / 2 + notchRadius, 0),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.lineTo(size.width - cornerRadius, 0);
    path.quadraticBezierTo(
        size.width, 0, size.width, cornerRadius); // Top right corner
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}






// Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedIndex = 0;
//                     currentScreen = screens[selectedIndex];
//                   });
//                 },
//                 child: Column(
//                   children: [
//                     CustomImageView(
//                       height: 50,
//                       width: 50,
//                       imagePath: ImageConstant.homeIcon,
//                     ),
//                     Text("Home",
//                         style: textTheme.labelSmall!.copyWith(
//                           color: selectedIndex == 0
//                               ? const Color.fromRGBO(138, 255, 248, 1)
//                               : appTheme.white,
//                         )),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedIndex = 1;
//                     currentScreen = screens[selectedIndex];
//                   });
//                 },
//                 child: Column(
//                   children: [
//                     CustomImageView(
//                       height: 50,
//                       width: 50,
//                       imagePath: ImageConstant.cardIcon,
//                     ),
//                     Text("Cards",
//                         style: textTheme.labelSmall!.copyWith(
//                           color: selectedIndex == 1
//                               ? const Color.fromRGBO(138, 255, 248, 1)
//                               : appTheme.white,
//                         )),
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   const SizedBox(
//                     height: 50,
//                     width: 50,
//                   ),
//                   Text("Scan Qr", style: textTheme.labelSmall),
//                 ],
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedIndex = 2;
//                     currentScreen = screens[selectedIndex];
//                   });
//                 },
//                 child: Column(
//                   children: [
//                     CustomImageView(
//                       height: 50,
//                       width: 50,
//                       imagePath: ImageConstant.balanceIcon,
//                     ),
//                     Text("Balance",
//                         style: textTheme.labelSmall!.copyWith(
//                           color: selectedIndex == 2
//                               ? const Color.fromRGBO(138, 255, 248, 1)
//                               : appTheme.white,
//                         )),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedIndex = 3;
//                     currentScreen = screens[selectedIndex];
//                   });
//                 },
//                 child: Column(
//                   children: [
//                     CustomImageView(
//                       height: 50,
//                       width: 50,
//                       imagePath: ImageConstant.menuIcon,
//                     ),
//                     Text(
//                       "More",
//                       style: textTheme.labelSmall!.copyWith(
//                         color: selectedIndex == 3
//                             ? const Color.fromRGBO(138, 255, 248, 1)
//                             : appTheme.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),