import 'package:app/ui/detail/detail_page.dart';
import 'package:app/ui/home/home_page.dart';
import 'package:app/ui/signIn/sign_in_page.dart';
import 'package:auto_route/auto_route.dart';

export 'app_route.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute<Object>>[
    AutoRoute(
      initial: true,
      path: '/home',
      page: HomePage,
    ),
    AutoRoute(
      path: '/signIn',
      page: SignInPage,
      fullscreenDialog: true,
    ),
    AutoRoute(
      path: '/detail',
      page: DetailPage,
    ),
  ],
)
class $AppRouter {}
