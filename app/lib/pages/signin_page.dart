import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jio_fashion_hack/components/signIn/signin_box.dart';
import 'package:jio_fashion_hack/components/widgets/logo_widget.dart';
import 'package:jio_fashion_hack/config/routes/routes.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      AutoRouter.of(context).replaceNamed(Routes.homeRoute.path!);
    }
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [LogoContainer(), SignInBox()]),
      ),
    );
  }
}
