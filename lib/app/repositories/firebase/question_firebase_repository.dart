import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/consts/database_tables_const.dart';
import '../../core/responses/response_builder.dart';
import '../../core/responses/response_defult.dart';
import '../../interfaces/question_repository_interface.dart';
import '../../models/question_model.dart';

class QuestionFirebaseRepository implements IQuestionRepository {
  final FirebaseFirestore firestore;

  QuestionFirebaseRepository(this.firestore);

  @override
  Future<DefaultResponse> getQuestions() async {
    try {
      final response = firestore
          .collection(DatabaseTablesConst.question)
          .orderBy('inclusion_date')
          .snapshots()
          .map((query) {
        return query.docs
            .map((doc) => QuestionModel.fromDocument(doc))
            .toList();
      });
      return ResponseBuilder.success(object: response);
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> save(QuestionModel model) async {
    try {
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
        model.reference.update({
          'title': model.title,
          'answer': model.answer,
          'color': model.color
        });
      }
      return ResponseBuilder.success();
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> delete(QuestionModel model) async {
    try {
      model.reference.delete();
      return ResponseBuilder.success();
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }
}
