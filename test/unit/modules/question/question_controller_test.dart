import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:snowmanlabs_challenge/app/core/responses/response_builder.dart';
import 'package:snowmanlabs_challenge/app/models/question_model.dart';
import 'package:snowmanlabs_challenge/app/modules/question/question_controller.dart';
import 'package:snowmanlabs_challenge/app/repositories/firebase/question_firebase_repository.dart';

class QuestionRepositoryMock extends Mock
    implements QuestionFirebaseRepository {}

void main() {
  final repository = QuestionRepositoryMock();

  test('when set value with parameter should return a value', () {
    final controller = QuestionController(repository, null);
    controller.selectedColor = "#ffffff";
    expect(controller.selectedColor, "#ffffff");

    controller.loading = true;
    expect(controller.loading, true);

    controller.isEditing = true;
    expect(controller.isEditing, true);

    controller.model = QuestionModel(title: "Title");
    expect(controller.model.title, "Title");
  });

  test('must save the record', () async {
    var message = "";
    final QuestionModel model = QuestionModel();

    when(repository.save(model)).thenAnswer((_) async {
      if (model.id == null) {
        message = "insert";
        return ResponseBuilder.success(message: "insert");
      } else {
        message = "update";
        return ResponseBuilder.success(message: "update");
      }
    });

    final controller = QuestionController(repository, model);
    await controller.save();

    expect(message, "insert");
  });

  test('must update the record', () async {
    var message = "";
    final QuestionModel model = QuestionModel();

    when(repository.save(model)).thenAnswer((_) async {
      if (model.id == null) {
        message = "insert";
        return ResponseBuilder.success(message: "insert");
      } else {
        message = "update";
        return ResponseBuilder.success(message: "update");
      }
    });
    final controller = QuestionController(repository, model);
    controller.model.id = 1;
    await controller.save();

    expect(message, "update");
  });

  test('should give error when saving the record', () async {
    final QuestionModel model = QuestionModel();
    var result = false;

    when(repository.save(model)).thenAnswer((_) async {
      return ResponseBuilder.failed();
    });

    final controller = QuestionController(repository, model);
    await controller.save().catchError((error) {
      result = true;
    });

    expect(result, true);
  });
}
