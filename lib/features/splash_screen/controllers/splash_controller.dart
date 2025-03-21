import 'dart:async';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startSplash();
  }

  void startSplash() {
    Future.delayed(Duration(seconds:3),()=>Get.offNamed(AppRoutes.login));
  }
}
