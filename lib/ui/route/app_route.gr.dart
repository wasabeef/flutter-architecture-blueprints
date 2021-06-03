// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:app/data/model/article.dart' as _i6;
import 'package:app/ui/detail/detail_page.dart' as _i5;
import 'package:app/ui/home/home_page.dart' as _i3;
import 'package:app/ui/signIn/sign_in_page.dart' as _i4;
import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.AdaptivePage<Object>(
        routeData: routeData,
        builder: (_) {
          return _i3.HomePage();
        }),
    SignInRoute.name: (routeData) => _i1.AdaptivePage<Object>(
        routeData: routeData,
        builder: (_) {
          return _i4.SignInPage();
        },
        fullscreenDialog: true),
    DetailRoute.name: (routeData) => _i1.AdaptivePage<Object>(
        routeData: routeData,
        builder: (data) {
          final queryParams = data.queryParams;
          final args = data.argsAs<DetailRouteArgs>(
              orElse: () =>
                  DetailRouteArgs(article: queryParams.get('article')));
          return _i5.DetailPage(article: args.article);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i1.RouteConfig(HomeRoute.name, path: '/home'),
        _i1.RouteConfig(SignInRoute.name, path: '/signIn'),
        _i1.RouteConfig(DetailRoute.name, path: '/detail')
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home');

  static const String name = 'HomeRoute';
}

class SignInRoute extends _i1.PageRouteInfo {
  const SignInRoute() : super(name, path: '/signIn');

  static const String name = 'SignInRoute';
}

class DetailRoute extends _i1.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({_i6.Article? article})
      : super(name,
            path: '/detail',
            args: DetailRouteArgs(article: article),
            rawQueryParams: {'article': article});

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({this.article});

  final _i6.Article? article;
}
