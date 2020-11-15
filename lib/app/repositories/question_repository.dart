import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/consts/database_tables_const.dart';
import '../interfaces/question_repository_interface.dart';
import '../models/question_model.dart';

class QuestionRepository implements IQuestionRepository {
  final FirebaseFirestore firestore;

  QuestionRepository(this.firestore);

  @override
  Stream<List<QuestionModel>> getQuestions() {
    return firestore
        .collection(DatabaseTablesConst.question)
        .orderBy('inclusion_date')
        .snapshots()
        .map((query) {
      return query.docs.map((doc) => QuestionModel.fromDocument(doc)).toList();
    });
  }

  @override
  Future save(QuestionModel model) async {
    if (model.reference == null) {
      model.reference = await FirebaseFirestore.instance
          .collection(DatabaseTablesConst.question)
          .add({
        'title': model.title,
        'answer': model.answer,
        'color': model.color,
        'inclusion_date': Timestamp.now()
      });
    } else {
      model.reference.update(
          {'title': model.title, 'answer': model.answer, 'color': model.color});
    }
  }

  @override
  Future delete(QuestionModel model) {
    return model.reference.delete();
  }
}
