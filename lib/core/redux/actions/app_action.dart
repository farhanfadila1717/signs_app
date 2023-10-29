import 'package:signs_app/core/models/quiz/question.dart';
import 'package:signs_app/core/models/sign/sign.dart';

class InitTtsAction {
  const InitTtsAction();
}

class GetQuestionsAction {
  const GetQuestionsAction();
}

class SetQuestionsAction {
  final List<Question> questions;

  const SetQuestionsAction(
    this.questions,
  );
}

class GetSignsAction {
  const GetSignsAction();
}

class SetSignsAction {
  final List<Sign> signs;

  const SetSignsAction(
    this.signs,
  );
}
