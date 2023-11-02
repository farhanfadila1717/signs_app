import 'package:signs_app/core/redux/actions/app_action.dart';
import 'package:signs_app/core/redux/states/app_state.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>(
  [
    TypedReducer<AppState, SetQuestionsAction>(_onSetQuestionsAction),
    TypedReducer<AppState, SetSignsAction>(_onSetSignsAction),
    TypedReducer<AppState, SetSignsByTypeAction>(_onSetSignsByTypeAction),
    TypedReducer<AppState, SetAboutAction>(_onSetAboutAction),
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

AppState _onSetSignsByTypeAction(
  AppState state,
  SetSignsByTypeAction action,
) {
  return state.copyWith(
    signsByType: action.signs,
  );
}

AppState _onSetAboutAction(
  AppState state,
  SetAboutAction action,
) {
  return state.copyWith(
    about: action.about,
  );
}
