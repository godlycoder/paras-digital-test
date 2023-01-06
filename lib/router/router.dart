import 'package:auto_route/annotations.dart';
import 'package:paras_test/app/ui/page/account_page.dart';
import 'package:paras_test/app/ui/page/dashboard_page.dart';
import 'package:paras_test/app/ui/page/detail_movie_page.dart';
import 'package:paras_test/app/ui/page/favorite_page.dart';
import 'package:paras_test/app/ui/page/home_page.dart';
import 'package:paras_test/app/ui/page/sign_in_page.dart';
import 'package:paras_test/app/ui/page/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage),
    AutoRoute(page: DashboardPage,
      children: [
        AutoRoute(page: HomePage, initial: true),
        AutoRoute(page: FavoritePage),
        AutoRoute(page: AccountPage),
      ]
    ),
    AutoRoute(page: DetailMoviePage)
  ],
)
class $AppRouter {}