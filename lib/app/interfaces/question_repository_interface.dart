import '../models/question_model.dart';

abstract class IQuestionRepository {
  Stream<List<QuestionModel>> getQuestions();

  Future save(QuestionModel model);

  Future delete(QuestionModel model);
}
