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
  Map<TypeSign, List<Sign>> get signsByType =>
      throw _privateConstructorUsedError;
  About? get about => throw _privateConstructorUsedError;

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
      List<Sign> signs,
      Map<TypeSign, List<Sign>> signsByType,
      About? about});

  $AuthenticationStateCopyWith<$Res> get authState;
  $AboutCopyWith<$Res>? get about;
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
    Object? signsByType = null,
    Object? about = freezed,
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
      signsByType: null == signsByType
          ? _value.signsByType
          : signsByType // ignore: cast_nullable_to_non_nullable
              as Map<TypeSign, List<Sign>>,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as About?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthenticationStateCopyWith<$Res> get authState {
    return $AuthenticationStateCopyWith<$Res>(_value.authState, (value) {
      return _then(_value.copyWith(authState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AboutCopyWith<$Res>? get about {
    if (_value.about == null) {
      return null;
    }

    return $AboutCopyWith<$Res>(_value.about!, (value) {
      return _then(_value.copyWith(about: value) as $Val);
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
      List<Sign> signs,
      Map<TypeSign, List<Sign>> signsByType,
      About? about});

  @override
  $AuthenticationStateCopyWith<$Res> get authState;
  @override
  $AboutCopyWith<$Res>? get about;
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
    Object? signsByType = null,
    Object? about = freezed,
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
      signsByType: null == signsByType
          ? _value._signsByType
          : signsByType // ignore: cast_nullable_to_non_nullable
              as Map<TypeSign, List<Sign>>,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as About?,
    ));
  }
}

/// @nodoc

class _$AppStateImpl extends _AppState {
  const _$AppStateImpl(
      {this.authState = const AuthenticationState(),
      final List<Question> questions = const [],
      final List<Sign> signs = const [],
      final Map<TypeSign, List<Sign>> signsByType = const {},
      this.about})
      : _questions = questions,
        _signs = signs,
        _signsByType = signsByType,
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

  final Map<TypeSign, List<Sign>> _signsByType;
  @override
  @JsonKey()
  Map<TypeSign, List<Sign>> get signsByType {
    if (_signsByType is EqualUnmodifiableMapView) return _signsByType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_signsByType);
  }

  @override
  final About? about;

  @override
  String toString() {
    return 'AppState(authState: $authState, questions: $questions, signs: $signs, signsByType: $signsByType, about: $about)';
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
            const DeepCollectionEquality().equals(other._signs, _signs) &&
            const DeepCollectionEquality()
                .equals(other._signsByType, _signsByType) &&
            (identical(other.about, about) || other.about == about));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      authState,
      const DeepCollectionEquality().hash(_questions),
      const DeepCollectionEquality().hash(_signs),
      const DeepCollectionEquality().hash(_signsByType),
      about);

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
      final List<Sign> signs,
      final Map<TypeSign, List<Sign>> signsByType,
      final About? about}) = _$AppStateImpl;
  const _AppState._() : super._();

  @override
  AuthenticationState get authState;
  @override
  List<Question> get questions;
  @override
  List<Sign> get signs;
  @override
  Map<TypeSign, List<Sign>> get signsByType;
  @override
  About? get about;
  @override
  @JsonKey(ignore: true)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
