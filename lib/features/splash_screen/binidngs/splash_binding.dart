import 'package:get/get.dart';
import 'package:morafiq_al_halaqat/features/splash_screen/controllers/splash_controller.dart';

class SplashScreenBinding extends Bindings{
  @override
  void dependencies()  {

    Get.put(SplashController());
  }
}