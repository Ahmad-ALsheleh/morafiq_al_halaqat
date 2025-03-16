import 'package:get/get.dart';

import '../../features/account/views/create_account_view.dart';
import '../../features/account/views/login_view.dart';
import '../../features/account/views/profile_view.dart';
import '../../features/halaqah/views/home_view.dart';
import '../../splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.login, page: () => LoginView()),
    GetPage(name: AppRoutes.createAccount, page: () => CreateAccountView()),
    GetPage(name: AppRoutes.home, page: () => HomeView()),
    //GetPage(name: AppRoutes.search, page: () => SearchScreen()),
    GetPage(name: AppRoutes.profile, page: () => ProfileView()),
    //GetPage(name: AppRoutes.notifications, page: () => NotificationsScreen()),
  ];
}
