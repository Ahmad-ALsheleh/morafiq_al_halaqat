import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  var studentsCount = 0.obs;
  var lessonsCount = 0.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void listenToStatistics() {
    final user = _auth.currentUser;
    if (user == null) return;

    _firestore
        .collection('users')
        .doc(user.uid)
        .collection('students')
        .snapshots()
        .listen((snapshot) {
      studentsCount.value = snapshot.size;
    });

    _firestore
        .collection('users')
        .doc(user.uid)
        .collection('lessons')
        .snapshots()
        .listen((snapshot) {
      lessonsCount.value = snapshot.size;
    });
  }

  @override
  void onInit() {
    super.onInit();
    listenToStatistics();
  }
}
