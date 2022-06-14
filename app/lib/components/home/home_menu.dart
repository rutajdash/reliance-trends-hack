import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jio_fashion_hack/config/constants/asset_paths.dart';
import 'package:jio_fashion_hack/config/routes/routes.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OutlinedButton(
              onPressed: () {
                AutoRouter.of(context)
                    .pushNamed(DashboardRoutes.landingDashboardRoute.path!);
              },
              child: Container(
                margin: const EdgeInsets.all(16),
                child: SvgPicture.asset(AssetPaths.images['dashboard-icon']!,
                    fit: BoxFit.fitHeight, height: 200),
              )),
          OutlinedButton(
              onPressed: () {
                AutoRouter.of(context)
                    .pushNamed(ScannerRoutes.takePictureRoute.path!);
              },
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Image.asset(AssetPaths.images['scanning-icon']!,
                    fit: BoxFit.fitHeight, height: 140),
              )),
        ]);
  }
}
