import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  String title;
  String answer;
  String color;

  DocumentReference reference;

  QuestionModel(
      {this.reference, this.title = '', this.answer = '', this.color = ''});

  factory QuestionModel.fromDocument(DocumentSnapshot doc) {
    return QuestionModel(
        title: doc['title'] as String,
        answer: doc['answer'] as String,
        color: doc['color'] as String,
        reference: doc.reference);
  }

  @override
  String toString() {
    return 'QuestionModel{title: $title, answer: $answer, color: $color}';
  }
}
