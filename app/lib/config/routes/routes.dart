import 'package:auto_route/annotations.dart';
import 'package:jio_fashion_hack/pages/dashboard.dart';
import 'package:jio_fashion_hack/pages/home_page.dart';
import 'package:jio_fashion_hack/pages/signin_page.dart';
import 'package:jio_fashion_hack/pages/take_picture_page.dart';

class AuthRoutes {
  static const AutoRoute signInRoute =
      AutoRoute(name: 'SignInRoute', path: '/signIn', page: SignInPage);

  static const AutoRoute signUpRoute =
      AutoRoute(name: 'SignUpRoute', path: '/signUp', page: SignInPage);

  static const List<AutoRoute> allRoutes = [signInRoute, signUpRoute];
}

class DashboardRoutes {
  static const landingDashboardRoute = AutoRoute(
      name: 'LandingDashboardRoute', path: '/dashboard', page: DashboardPage);

  static const List<AutoRoute> allRoutes = [landingDashboardRoute];
}

class ScannerRoutes {
  static const AutoRoute takePictureRoute = AutoRoute(
      name: 'TakePictureRoute',
      path: '/scanner/capture',
      page: TakePicturePage);

  static const List<AutoRoute> allRoutes = [takePictureRoute];
}

class Routes {
  static const AutoRoute homeRoute = AutoRoute(
    name: 'HomePageRoute',
    path: '/',
    page: HomePage,
    initial: true,
  );

  static const List<AutoRoute> root = [homeRoute, ...AuthRoutes.allRoutes];

  static const List<AutoRoute> all = [
    homeRoute,
    ...AuthRoutes.allRoutes,
    ...DashboardRoutes.allRoutes,
    ...ScannerRoutes.allRoutes,
  ];
}
