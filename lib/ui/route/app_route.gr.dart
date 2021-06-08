// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:app/data/model/article.dart' as _i8;
import 'package:app/ui/detail/detail_page.dart' as _i5;
import 'package:app/ui/home/home_page.dart' as _i3;
import 'package:app/ui/news/news_page.dart' as _i6;
import 'package:app/ui/signIn/sign_in_page.dart' as _i4;
import 'package:app/ui/video/video_page.dart' as _i7;
import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomePage();
        }),
    SignInRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.SignInPage();
        },
        fullscreenDialog: true),
    DetailRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final queryParams = data.queryParams;
          final args = data.argsAs<DetailRouteArgs>(
              orElse: () =>
                  DetailRouteArgs(article: queryParams.get('article')));
          return _i5.DetailPage(article: args.article);
        }),
    NewsRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.NewsPage();
        }),
    VideoRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.VideoPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/', children: [
          _i1.RouteConfig(NewsRoute.name, path: 'news'),
          _i1.RouteConfig(VideoRoute.name, path: 'video')
        ]),
        _i1.RouteConfig(SignInRoute.name, path: '/signIn'),
        _i1.RouteConfig(DetailRoute.name, path: '/detail')
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

class SignInRoute extends _i1.PageRouteInfo {
  const SignInRoute() : super(name, path: '/signIn');

  static const String name = 'SignInRoute';
}

class DetailRoute extends _i1.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({_i8.Article? article})
      : super(name,
            path: '/detail',
            args: DetailRouteArgs(article: article),
            rawQueryParams: {'article': article});

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({this.article});

  final _i8.Article? article;
}

class NewsRoute extends _i1.PageRouteInfo {
  const NewsRoute() : super(name, path: 'news');

  static const String name = 'NewsRoute';
}

class VideoRoute extends _i1.PageRouteInfo {
  const VideoRoute() : super(name, path: 'video');

  static const String name = 'VideoRoute';
}
