import 'package:get/get.dart';

class NavController extends GetxController {
  var selectedIndex = 2.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}











































//   void changePage(int index) {
//     selectedIndex.value = index;
//     switch (index) {
//       case 0:
//         Get.offNamed(AppRoutes.profile);
//         break;
//       case 1:
//         Get.offNamed(AppRoutes.MyHalaqah);
//         break;
//       case 2:
//         Get.offNamed(AppRoutes.home);
//         break;
//        case 3:
//         Get.offNamed(AppRoutes.search);
//         break;
//         case 4:
//         Get.offNamed(AppRoutes.Statistics);
//         break;
//     }
//   }
// }
