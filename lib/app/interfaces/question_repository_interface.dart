import '../models/question_model.dart';

abstract class IQuestionRepository {
  Stream<List<QuestionModel>> getQuestions();
}
