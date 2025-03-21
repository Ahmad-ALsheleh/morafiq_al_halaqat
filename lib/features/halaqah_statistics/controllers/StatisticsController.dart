import 'package:get/get.dart';

class StatisticsController extends GetxController {
  var studentsCount = 0.obs;
  var lessonsCount = 0.obs;


  void fetchStatistics() {
    studentsCount.value = 25;
    lessonsCount.value = 40;
  }

  @override
  void onInit() {
    super.onInit();
    fetchStatistics();
  }
}
