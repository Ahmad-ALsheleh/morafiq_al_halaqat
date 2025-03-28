import 'package:get/get.dart';
import 'package:morafiq_al_halaqat/features/splash_screen/binidngs/splash_binding.dart';

import '../../features/home/home_main_view.dart';
import '../../features/home/home_view.dart';
import '../../search_view.dart';
import '../../features/account/views/create_account_view.dart';
import '../../features/account/views/login_view.dart';
import '../../features/account/views/profile_view.dart';
import '../../features/halaqah/views/my_halaqah_view.dart';
import '../../features/halaqah_statistics/views/halaqah_statistics_view.dart';
import '../../features/splash_screen/views/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen(),binding: SplashScreenBinding()),
    GetPage(name: AppRoutes.login, page: () => LoginView()),
    GetPage(name: AppRoutes.createAccount, page: () => CreateAccountView()),

    GetPage(name: AppRoutes.profile, page: () => ProfileView()),
    GetPage(name: AppRoutes.MyHalaqah, page: () => MyHalaqahView()),
    GetPage(name: AppRoutes.home, page: () => HomeView()),
    GetPage(name: AppRoutes.homemain, page: () => HomeMainView()),
    GetPage(name: AppRoutes.search, page: () => Searchview()),
    GetPage(name: AppRoutes.Statistics, page: () => HalaqahStatisticsView()),

  ];
}
