import 'package:flags_app/core/models/flag/flag.dart';
import 'package:flags_app/core/models/quiz/question.dart';

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

class GetFlagsAction {
  const GetFlagsAction();
}

class SetFlagsAction {
  final List<Flag> flags;

  const SetFlagsAction(this.flags);
}
