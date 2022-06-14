import 'package:flutter/material.dart';
import 'package:jio_fashion_hack/api/auth/signin_api.dart';

class SignInButton extends StatelessWidget {
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;

  const SignInButton(
      {Key? key,
      required this.emailTextController,
      required this.passwordTextController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(84, 16, 24, 8),
        child: ElevatedButton(
            onPressed: () =>
                signIn(context, emailTextController, passwordTextController),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Flexible(
                        fit: FlexFit.loose,
                        child: Text('Sign In', style: TextStyle(fontSize: 20))),
                    SizedBox(
                      height: 32,
                      width: 32,
                      child: Icon(Icons.arrow_forward),
                    ),
                  ]),
            )));
  }
}
