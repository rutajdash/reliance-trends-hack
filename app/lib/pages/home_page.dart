import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jio_fashion_hack/components/home/home_menu.dart';
import 'package:jio_fashion_hack/components/shared/top_bar.dart';
import 'package:jio_fashion_hack/config/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      AutoRouter.of(context).replaceNamed(AuthRoutes.signInRoute.path!);
    }
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0),
        child: Stack(
          fit: StackFit.passthrough,
          children: const [
            TopBar(),
            HomeMenu(),
          ],
        ),
      ),
    );
  }
}
