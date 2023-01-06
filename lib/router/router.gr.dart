// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/cupertino.dart' as _i10;
import 'package:flutter/material.dart' as _i9;

import '../app/ui/page/account_page.dart' as _i7;
import '../app/ui/page/dashboard_page.dart' as _i3;
import '../app/ui/page/detail_movie_page.dart' as _i4;
import '../app/ui/page/favorite_page.dart' as _i6;
import '../app/ui/page/home_page.dart' as _i5;
import '../app/ui/page/sign_in_page.dart' as _i2;
import '../app/ui/page/splash_page.dart' as _i1;
import '../domain/uimodel/movie.dart' as _i11;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignInPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardPage(),
      );
    },
    DetailMovieRoute.name: (routeData) {
      final args = routeData.argsAs<DetailMovieRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.DetailMoviePage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.FavoritePage(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AccountPage(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          SignInRoute.name,
          path: '/sign-in-page',
        ),
        _i8.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard-page',
          children: [
            _i8.RouteConfig(
              HomeRoute.name,
              path: '',
              parent: DashboardRoute.name,
            ),
            _i8.RouteConfig(
              FavoriteRoute.name,
              path: 'favorite-page',
              parent: DashboardRoute.name,
            ),
            _i8.RouteConfig(
              AccountRoute.name,
              path: 'account-page',
              parent: DashboardRoute.name,
            ),
          ],
        ),
        _i8.RouteConfig(
          DetailMovieRoute.name,
          path: '/detail-movie-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i8.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign-in-page',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboard-page',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.DetailMoviePage]
class DetailMovieRoute extends _i8.PageRouteInfo<DetailMovieRouteArgs> {
  DetailMovieRoute({
    _i10.Key? key,
    required _i11.MovieUiModel data,
  }) : super(
          DetailMovieRoute.name,
          path: '/detail-movie-page',
          args: DetailMovieRouteArgs(
            key: key,
            data: data,
          ),
        );

  static const String name = 'DetailMovieRoute';
}

class DetailMovieRouteArgs {
  const DetailMovieRouteArgs({
    this.key,
    required this.data,
  });

  final _i10.Key? key;

  final _i11.MovieUiModel data;

  @override
  String toString() {
    return 'DetailMovieRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.FavoritePage]
class FavoriteRoute extends _i8.PageRouteInfo<void> {
  const FavoriteRoute()
      : super(
          FavoriteRoute.name,
          path: 'favorite-page',
        );

  static const String name = 'FavoriteRoute';
}

/// generated route for
/// [_i7.AccountPage]
class AccountRoute extends _i8.PageRouteInfo<void> {
  const AccountRoute()
      : super(
          AccountRoute.name,
          path: 'account-page',
        );

  static const String name = 'AccountRoute';
}
