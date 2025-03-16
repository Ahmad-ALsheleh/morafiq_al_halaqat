import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.offNamed(AppRoutes.home);
        break;
      case 1:
        Get.offNamed(AppRoutes.search);
        break;
      case 2:
        Get.offNamed(AppRoutes.profile);
        break;
      // case 3:
      //   Get.offNamed(AppRoutes.notifications);
      //   break;
    }
  }
}
