import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:snowmanlabs_challenge/app/core/responses/response_builder.dart';
import 'package:snowmanlabs_challenge/app/models/question_model.dart';
import 'package:snowmanlabs_challenge/app/repositories/firebase/question_firebase_repository.dart';

class QuestionRepositoryMock extends Mock
    implements QuestionFirebaseRepository {}

void main() {
  final repository = QuestionRepositoryMock();

  test('must save the record', () async {
    final QuestionModel model = QuestionModel();
    var result = false;

    when(repository.save(model)).thenAnswer((_) async {
      return ResponseBuilder.success();
    });

    await repository
        .save(model)
        .then((value) => result = value.success == true);
    expect(result, true);
  });

  test('should give error when saving the record', () async {
    final QuestionModel model = QuestionModel();
    var result = false;

    when(repository.save(model)).thenAnswer((_) async {
      return ResponseBuilder.failed();
    });

    await repository.save(model).then((value) => result = value.failed == true);

    expect(result, true);
  });

  test('must delete the record', () async {
    final QuestionModel model = QuestionModel();
    var result = false;

    when(repository.delete(model)).thenAnswer((_) async {
      return ResponseBuilder.success();
    });

    await repository
        .delete(model)
        .then((value) => result = value.success == true);
    expect(result, true);
  });
}
