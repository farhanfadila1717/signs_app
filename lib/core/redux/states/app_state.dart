import 'package:signs_app/core/models/about/about.dart';
import 'package:signs_app/core/models/quiz/question.dart';
import 'package:signs_app/core/models/sign/sign.dart';
import 'package:signs_app/core/redux/states/authentication_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const AppState._();

  const factory AppState({
    @Default(AuthenticationState()) AuthenticationState authState,
    @Default([]) List<Question> questions,
    @Default([]) List<Sign> signs,
    @Default({}) Map<String, List<Sign>> signsByType,
    About? about,
  }) = _AppState;
}
