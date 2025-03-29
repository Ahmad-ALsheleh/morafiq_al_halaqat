import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/students_model.dart';

class StudentsRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? get _userId => _auth.currentUser?.uid;

  Stream<List<Student>> getStudents() {
    if (_userId == null) return const Stream.empty();

    return _firestore
        .collection('users')
        .doc(_userId)
        .collection('students')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Student.fromMap(doc.id, doc.data()))
        .toList());
  }

  Future<void> addStudent(String name) async {
    if (name.isEmpty || _userId == null) return;

    await _firestore
        .collection('users')
        .doc(_userId)
        .collection('students')
        .add({'name': name});
  }

  Future<void> removeStudent(String studentId) async {
    if (_userId == null) return;

    await _firestore
        .collection('users')
        .doc(_userId)
        .collection('students')
        .doc(studentId)
        .delete();
  }
}
