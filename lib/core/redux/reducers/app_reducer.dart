import 'package:signs_app/core/redux/actions/app_action.dart';
import 'package:signs_app/core/redux/states/app_state.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>(
  [
    TypedReducer<AppState, SetQuestionsAction>(_onSetQuestionsAction),
    TypedReducer<AppState, SetSignsAction>(_onSetSignsAction),
  ],
);

AppState _onSetQuestionsAction(
  AppState state,
  SetQuestionsAction action,
) {
  return state.copyWith(
    questions: action.questions,
  );
}

AppState _onSetSignsAction(
  AppState state,
  SetSignsAction action,
) {
  return state.copyWith(
    signs: action.signs,
  );
}
