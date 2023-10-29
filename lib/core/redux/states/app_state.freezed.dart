// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  AuthenticationState get authState => throw _privateConstructorUsedError;
  List<Question> get questions => throw _privateConstructorUsedError;
  List<Sign> get signs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {AuthenticationState authState,
      List<Question> questions,
      List<Sign> signs});

  $AuthenticationStateCopyWith<$Res> get authState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authState = null,
    Object? questions = null,
    Object? signs = null,
  }) {
    return _then(_value.copyWith(
      authState: null == authState
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthenticationState,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      signs: null == signs
          ? _value.signs
          : signs // ignore: cast_nullable_to_non_nullable
              as List<Sign>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthenticationStateCopyWith<$Res> get authState {
    return $AuthenticationStateCopyWith<$Res>(_value.authState, (value) {
      return _then(_value.copyWith(authState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthenticationState authState,
      List<Question> questions,
      List<Sign> signs});

  @override
  $AuthenticationStateCopyWith<$Res> get authState;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authState = null,
    Object? questions = null,
    Object? signs = null,
  }) {
    return _then(_$AppStateImpl(
      authState: null == authState
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthenticationState,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      signs: null == signs
          ? _value._signs
          : signs // ignore: cast_nullable_to_non_nullable
              as List<Sign>,
    ));
  }
}

/// @nodoc

class _$AppStateImpl extends _AppState {
  const _$AppStateImpl(
      {this.authState = const AuthenticationState(),
      final List<Question> questions = const [],
      final List<Sign> signs = const []})
      : _questions = questions,
        _signs = signs,
        super._();

  @override
  @JsonKey()
  final AuthenticationState authState;
  final List<Question> _questions;
  @override
  @JsonKey()
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  final List<Sign> _signs;
  @override
  @JsonKey()
  List<Sign> get signs {
    if (_signs is EqualUnmodifiableListView) return _signs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_signs);
  }

  @override
  String toString() {
    return 'AppState(authState: $authState, questions: $questions, signs: $signs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.authState, authState) ||
                other.authState == authState) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            const DeepCollectionEquality().equals(other._signs, _signs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      authState,
      const DeepCollectionEquality().hash(_questions),
      const DeepCollectionEquality().hash(_signs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState extends AppState {
  const factory _AppState(
      {final AuthenticationState authState,
      final List<Question> questions,
      final List<Sign> signs}) = _$AppStateImpl;
  const _AppState._() : super._();

  @override
  AuthenticationState get authState;
  @override
  List<Question> get questions;
  @override
  List<Sign> get signs;
  @override
  @JsonKey(ignore: true)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
