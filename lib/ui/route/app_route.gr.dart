// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:app/data/model/article.dart' as _i8;
import 'package:app/ui/detail/detail_page.dart' as _i3;
import 'package:app/ui/home/home_page.dart' as _i1;
import 'package:app/ui/news/news_page.dart' as _i4;
import 'package:app/ui/signIn/sign_in_page.dart' as _i2;
import 'package:app/ui/video/video_page.dart' as _i5;
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    SignInRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.SignInPage(),
          fullscreenDialog: true);
    },
    DetailRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<DetailRouteArgs>(
          orElse: () => DetailRouteArgs(article: queryParams.get('article')));
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.DetailPage(article: args.article));
    },
    NewsRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: _i4.NewsPage());
    },
    VideoRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: _i5.VideoPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(HomeRoute.name, path: '/', children: [
          _i6.RouteConfig(NewsRoute.name, path: 'news', parent: HomeRoute.name),
          _i6.RouteConfig(VideoRoute.name,
              path: 'video', parent: HomeRoute.name)
        ]),
        _i6.RouteConfig(SignInRoute.name, path: '/signIn'),
        _i6.RouteConfig(DetailRoute.name, path: '/detail')
      ];
}

/// generated route for [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for [_i2.SignInPage]
class SignInRoute extends _i6.PageRouteInfo<void> {
  const SignInRoute() : super(name, path: '/signIn');

  static const String name = 'SignInRoute';
}

/// generated route for [_i3.DetailPage]
class DetailRoute extends _i6.PageRouteInfo<DetailRouteArgs> {
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

/// generated route for [_i4.NewsPage]
class NewsRoute extends _i6.PageRouteInfo<void> {
  const NewsRoute() : super(name, path: 'news');

  static const String name = 'NewsRoute';
}

/// generated route for [_i5.VideoPage]
class VideoRoute extends _i6.PageRouteInfo<void> {
  const VideoRoute() : super(name, path: 'video');

  static const String name = 'VideoRoute';
}
