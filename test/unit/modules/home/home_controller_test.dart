import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:snowmanlabs_challenge/app/core/responses/response_builder.dart';
import 'package:snowmanlabs_challenge/app/models/question_model.dart';
import 'package:snowmanlabs_challenge/app/modules/home/home_controller.dart';
import 'package:snowmanlabs_challenge/app/repositories/firebase/question_firebase_repository.dart';

import '../../repositories/firebase/question_firebase_repository_test.dart';

List<QuestionModel> list = [
  QuestionModel(title: "Title 1", answer: "Answer 1", color: "#FFFFFF"),
  QuestionModel(title: "Title 2", answer: "Answer 2", color: "#FFFFFF"),
  QuestionModel(title: "Title 3", answer: "Answer 3", color: "#FFFFFF"),
  QuestionModel(title: "Title 4", answer: "Answer 4", color: "#FFFFFF"),
  QuestionModel(title: "Title 5", answer: "Answer 5", color: "#FFFFFF"),
];

class QuestionRepositoryMock2 extends Mock
    implements QuestionFirebaseRepository {}

void main() {
  final repository = QuestionRepositoryMock();

  test('must delete the record', () async {
    final QuestionModel model = QuestionModel();
    var result = false;

    when(repository.delete(model)).thenAnswer((_) async {
      return ResponseBuilder.success();
    });

    when(repository.getQuestions()).thenAnswer((_) async {
      return ResponseBuilder.failed();
    });

    final controller = HomeController(repository);
    await controller.deleteQuestion(model).then((_) {
      result = true;
    });
    expect(result, true);
  });
}
