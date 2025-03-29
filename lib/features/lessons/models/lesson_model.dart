import 'package:cloud_firestore/cloud_firestore.dart';

class Lesson {
  final String id;
  final String title;
  final String description;
  final DateTime? timestamp;

  Lesson({
    required this.id,
    required this.title,
    required this.description,
    this.timestamp,
  });

  factory Lesson.fromMap(String id, Map<String, dynamic> data) {
    return Lesson(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      timestamp: (data['timestamp'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'timestamp': timestamp ?? FieldValue.serverTimestamp(),
    };
  }
}
