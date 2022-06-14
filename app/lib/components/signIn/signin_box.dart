import 'package:flutter/material.dart';
import 'package:jio_fashion_hack/components/signIn/signin_button.dart';
import 'package:jio_fashion_hack/components/signIn/signin_text_input.dart';
import 'package:jio_fashion_hack/config/themes/light_theme.dart';

class SignInBox extends StatefulWidget {
  const SignInBox({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInBox> createState() => _SignInBoxState();
}

class _SignInBoxState extends State<SignInBox> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(8, 32, 8, 32),
        margin: const EdgeInsets.all(32),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: lightThemeData.primaryColorLight,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(children: [
          SignInTextInput(
              fieldIcon: Icons.email,
              textInputType: TextInputType.emailAddress,
              textEditingController: emailTextController),
          SignInTextInput(
              fieldIcon: Icons.password,
              textInputType: TextInputType.visiblePassword,
              textEditingController: passwordTextController),
          SignInButton(
              emailTextController: emailTextController,
              passwordTextController: passwordTextController),
        ]));
  }
}
