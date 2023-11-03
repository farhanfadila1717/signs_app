import 'package:signs_app/core/models/about/about.dart';
import 'package:signs_app/core/models/quiz/question.dart';
import 'package:signs_app/core/models/sign/sign.dart';
import 'package:signs_app/core/models/sign/type_sign.dart';

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

class SetSignsByTypeAction {
  final Map<TypeSign, List<Sign>> signs;

  const SetSignsByTypeAction(
    this.signs,
  );
}

class GetAboutAction {
  const GetAboutAction();
}

class SetAboutAction {
  final About about;

  const SetAboutAction(
    this.about,
  );
}
