// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../pages/dashboard.dart' as _i3;
import '../../pages/home_page.dart' as _i1;
import '../../pages/signin_page.dart' as _i2;
import '../../pages/take_picture_page.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    SignInRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    LandingDashboardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.DashboardPage());
    },
    TakePictureRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.TakePicturePage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomePageRoute.name, path: '/'),
        _i5.RouteConfig(SignInRoute.name, path: '/signIn'),
        _i5.RouteConfig(SignUpRoute.name, path: '/signUp'),
        _i5.RouteConfig(LandingDashboardRoute.name, path: '/dashboard'),
        _i5.RouteConfig(TakePictureRoute.name, path: '/scanner/capture')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i5.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i5.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/signIn');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignUpRoute extends _i5.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/signUp');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class LandingDashboardRoute extends _i5.PageRouteInfo<void> {
  const LandingDashboardRoute()
      : super(LandingDashboardRoute.name, path: '/dashboard');

  static const String name = 'LandingDashboardRoute';
}

/// generated route for
/// [_i4.TakePicturePage]
class TakePictureRoute extends _i5.PageRouteInfo<void> {
  const TakePictureRoute()
      : super(TakePictureRoute.name, path: '/scanner/capture');

  static const String name = 'TakePictureRoute';
}
