import 'package:flags_app/core/models/authentication/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';
part 'authentication_state.g.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState._();

  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AuthenticationState({
    User? user,
  }) = _AuthenticationState;

  factory AuthenticationState.logout() => const AuthenticationState();

  bool get isLoggedIn => user != null;

  factory AuthenticationState.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationStateFromJson(json);
}
