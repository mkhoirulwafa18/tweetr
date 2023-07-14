import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/common/widgets/rounded_button.dart';
import 'package:twitter_clone/features/auth/view/signup_view.dart';
import 'package:twitter_clone/features/auth/widgets/login_field.dart';
import 'package:twitter_clone/theme/pallete.dart';

import '../../../constants/constants.dart';

class LoginView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginView());
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Email Textfield
                LoginField(controller: emailController, hintText: 'Email'),
                const SizedBox(
                  height: 25,
                ),
                // Password Textfield
                LoginField(
                    controller: passwordController, hintText: 'Password'),
                const SizedBox(
                  height: 25,
                ),
                // Button
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedButton(
                    onTap: () {},
                    label: 'Done',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // Textspan
                RichText(
                    text: TextSpan(
                        text: "Don't have an account?",
                        style: const TextStyle(fontSize: 16),
                        children: [
                      TextSpan(
                          text: ' Sign Up',
                          style: const TextStyle(
                              fontSize: 16, color: Pallete.blueColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, SignupView.route());
                            })
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
