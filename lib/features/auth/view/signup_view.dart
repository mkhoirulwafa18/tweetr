import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';

import '../../../common/common.dart';
import '../../../constants/constants.dart';
import '../../../theme/theme.dart';
import '../widgets/login_field.dart';

class SignupView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupView());
  const SignupView({Key? key}) : super(key: key);

  @override
  ConsumerState<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signUp(
        email: emailController.text,
        password: passwordController.text,
        context: context);
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
                    onTap: onSignUp,
                    label: 'Done',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // Textspan
                RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: const TextStyle(fontSize: 16),
                        children: [
                      TextSpan(
                          text: ' Login',
                          style: const TextStyle(
                              fontSize: 16, color: Pallete.blueColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, LoginView.route());
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
