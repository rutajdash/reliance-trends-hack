import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jio_fashion_hack/config/routes/routes.dart';

void signIn(BuildContext context, TextEditingController emailTextController,
    TextEditingController passwordTextController) {
  FirebaseAuth.instance
      .signInWithEmailAndPassword(
          email: emailTextController.value.text,
          password: passwordTextController.value.text)
      .then((credential) {
    AutoRouter.of(context).replaceNamed(Routes.homeRoute.path!);
  }).catchError((error) {
    String errorMessage;
    switch (error.code) {
      case 'user-not-found':
        errorMessage = 'No user found for the given email.';
        break;
      case 'internal-error':
        errorMessage =
            'An unexpected internal error occurred. Please try again later.';
        break;
      case 'invalid-email':
        errorMessage = 'The email provided is not valid.';
        break;
      case 'wrong-password':
        errorMessage = 'The password provided is incorrect.';
        break;
      default:
        errorMessage = 'An unknown error occurred. Please try again later,';
    }
    if (kDebugMode) {
      print(error);
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(errorMessage),
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ));
  });
}
