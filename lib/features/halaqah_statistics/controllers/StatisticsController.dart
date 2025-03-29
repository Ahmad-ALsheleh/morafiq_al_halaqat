import 'dart:async';
import 'package:get/get.dart';

import '../repositorys/statistics_repository.dart';

class StatisticsController extends GetxController {
  final StatisticsRepository _repository = StatisticsRepository();

  var studentsCount = 0.obs;
  var lessonsCount = 0.obs;

  StreamSubscription<int>? studentsSubscription;
  StreamSubscription<int>? lessonsSubscription;

  @override
  void onInit() {
    super.onInit();
    listenToStatistics();
  }

  @override
  void onClose() {
    studentsSubscription?.cancel();
    lessonsSubscription?.cancel();
    super.onClose();
  }

  void listenToStatistics() {
    studentsSubscription = _repository.getStudentsCountStream().listen(
          (count) {
        studentsCount.value = count;
      },
    );

    lessonsSubscription = _repository.getLessonsCountStream().listen(
          (count) {
        lessonsCount.value = count;
      },
    );
  }
}
