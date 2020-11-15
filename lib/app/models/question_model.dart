import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/consts/database_tables_const.dart';

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

  Future<void> save() async {
    if (reference == null) {
      reference = await FirebaseFirestore.instance
          .collection(DatabaseTablesConst.question)
          .add({'title': title, 'answer': answer, 'color': color});
    } else {
      reference.update({'title': title, 'answer': answer, 'color': color});
    }
  }

  void delete() {
    reference.delete();
  }

  @override
  String toString() {
    return 'QuestionModel{title: $title, answer: $answer, color: $color}';
  }
}
