// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sign _$SignFromJson(Map<String, dynamic> json) {
  return _Sign.fromJson(json);
}

/// @nodoc
mixin _$Sign {
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignCopyWith<Sign> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignCopyWith<$Res> {
  factory $SignCopyWith(Sign value, $Res Function(Sign) then) =
      _$SignCopyWithImpl<$Res, Sign>;
  @useResult
  $Res call({String name, String image, String description, String type});
}

/// @nodoc
class _$SignCopyWithImpl<$Res, $Val extends Sign>
    implements $SignCopyWith<$Res> {
  _$SignCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? description = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignImplCopyWith<$Res> implements $SignCopyWith<$Res> {
  factory _$$SignImplCopyWith(
          _$SignImpl value, $Res Function(_$SignImpl) then) =
      __$$SignImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String image, String description, String type});
}

/// @nodoc
class __$$SignImplCopyWithImpl<$Res>
    extends _$SignCopyWithImpl<$Res, _$SignImpl>
    implements _$$SignImplCopyWith<$Res> {
  __$$SignImplCopyWithImpl(_$SignImpl _value, $Res Function(_$SignImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? description = null,
    Object? type = null,
  }) {
    return _then(_$SignImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SignImpl extends _Sign {
  const _$SignImpl(
      {required this.name,
      required this.image,
      required this.description,
      required this.type})
      : super._();

  factory _$SignImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignImplFromJson(json);

  @override
  final String name;
  @override
  final String image;
  @override
  final String description;
  @override
  final String type;

  @override
  String toString() {
    return 'Sign(name: $name, image: $image, description: $description, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, image, description, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignImplCopyWith<_$SignImpl> get copyWith =>
      __$$SignImplCopyWithImpl<_$SignImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignImplToJson(
      this,
    );
  }
}

abstract class _Sign extends Sign {
  const factory _Sign(
      {required final String name,
      required final String image,
      required final String description,
      required final String type}) = _$SignImpl;
  const _Sign._() : super._();

  factory _Sign.fromJson(Map<String, dynamic> json) = _$SignImpl.fromJson;

  @override
  String get name;
  @override
  String get image;
  @override
  String get description;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$SignImplCopyWith<_$SignImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
