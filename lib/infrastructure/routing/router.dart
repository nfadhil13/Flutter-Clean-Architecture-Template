import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen,Route")
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, path: '/login'),
        AutoRoute(page: SplashRoute.page, path: '/splash', initial: true),
        AutoRoute(page: HomeRoute.page, path: '/home')
      ];
}
