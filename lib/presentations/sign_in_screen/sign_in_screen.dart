import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_management_app/presentations/common/common_text_field_widgets.dart';
import 'package:fund_management_app/presentations/landing_screen/landing_screen.dart';
import 'package:fund_management_app/presentations/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:fund_management_app/theme/theme_helper.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static const routeName = '/sign-in-screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: const SignInScreenBody(),
    );
  }
}

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({super.key});

  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyState();
}

class _SignInScreenBodyState extends State<SignInScreenBody> {
  bool obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomPaint(
          painter: CustomShapePainter2(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign In",
                  style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Email",
                  style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 15),
                CommonTextFieldWidget(
                  hintText: "Enter your email",
                  controller: emailController,
                  focusNode: emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                Text(
                  "Password",
                  style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 15),
                CommonTextFieldWidget(
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  hintText: "Enter your password",
                  keyboardType: TextInputType.text,
                  obscureText: obscureText,
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Icon(
                      obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 24,
                      color: appTheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: textTheme.bodySmall!.copyWith(
                        color: appTheme.primary,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                BlocConsumer<SignInBloc, SignInState>(
                  listener: (context, state) {
                    if (state is SignInSuccess) {
                      context.pushReplacementNamed(LandingScreen.routeName);
                    }
                    if (state is SignInError) {
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
                    return GestureDetector(
                      onTap: () {
                        context.read<SignInBloc>().add(SignIn(
                            email: emailController.text,
                            password: passwordController.text));
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: appTheme.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              state is SignInLoading
                                  ? "Singning In..."
                                  : "Sign In",
                              style: textTheme.bodySmall!.copyWith(
                                color: appTheme.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have account? ",
                      style: textTheme.bodySmall!.copyWith(
                        color: appTheme.primary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Sign Up",
                        style: textTheme.bodySmall!.copyWith(
                          color: appTheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomShapePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = appTheme.primary
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    Path path = Path();
    // path.lineTo(0, size.height * 0.65);
    // path.quadraticBezierTo(
    //     size.width * 0.5, size.height * 0.85, size.width, size.height * 0.75);
    // path.lineTo(size.width, size.height * 0.75);
    // path.lineTo(size.width, 0);

    path.moveTo(0, size.height * 0.65);
    path.lineTo(0, size.height * 0.65);
    path.quadraticBezierTo(
        size.width * 0.45, size.height * 0.88, size.width, size.height * 0.75);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
