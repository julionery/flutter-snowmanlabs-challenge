import '../core/responses/response_defult.dart';
import '../models/question_model.dart';

abstract class IQuestionRepository {
  Future<DefaultResponse> getQuestions();

  Future<DefaultResponse> save(QuestionModel model);

  Future<DefaultResponse> delete(QuestionModel model);
}
