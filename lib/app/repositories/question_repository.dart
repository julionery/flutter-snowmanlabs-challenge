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
        .snapshots()
        .map((query) {
      return query.docs.map((doc) => QuestionModel.fromDocument(doc)).toList();
    });
  }
}
