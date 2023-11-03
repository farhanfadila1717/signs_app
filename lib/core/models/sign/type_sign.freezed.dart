// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'type_sign.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TypeSign _$TypeSignFromJson(Map<String, dynamic> json) {
  return _TypeSign.fromJson(json);
}

/// @nodoc
mixin _$TypeSign {
  String get id => throw _privateConstructorUsedError;
  String get displayedName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get foregroundColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeSignCopyWith<TypeSign> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeSignCopyWith<$Res> {
  factory $TypeSignCopyWith(TypeSign value, $Res Function(TypeSign) then) =
      _$TypeSignCopyWithImpl<$Res, TypeSign>;
  @useResult
  $Res call(
      {String id,
      String displayedName,
      String description,
      String color,
      String foregroundColor});
}

/// @nodoc
class _$TypeSignCopyWithImpl<$Res, $Val extends TypeSign>
    implements $TypeSignCopyWith<$Res> {
  _$TypeSignCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayedName = null,
    Object? description = null,
    Object? color = null,
    Object? foregroundColor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayedName: null == displayedName
          ? _value.displayedName
          : displayedName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      foregroundColor: null == foregroundColor
          ? _value.foregroundColor
          : foregroundColor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeSignImplCopyWith<$Res>
    implements $TypeSignCopyWith<$Res> {
  factory _$$TypeSignImplCopyWith(
          _$TypeSignImpl value, $Res Function(_$TypeSignImpl) then) =
      __$$TypeSignImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String displayedName,
      String description,
      String color,
      String foregroundColor});
}

/// @nodoc
class __$$TypeSignImplCopyWithImpl<$Res>
    extends _$TypeSignCopyWithImpl<$Res, _$TypeSignImpl>
    implements _$$TypeSignImplCopyWith<$Res> {
  __$$TypeSignImplCopyWithImpl(
      _$TypeSignImpl _value, $Res Function(_$TypeSignImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayedName = null,
    Object? description = null,
    Object? color = null,
    Object? foregroundColor = null,
  }) {
    return _then(_$TypeSignImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayedName: null == displayedName
          ? _value.displayedName
          : displayedName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      foregroundColor: null == foregroundColor
          ? _value.foregroundColor
          : foregroundColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$TypeSignImpl extends _TypeSign {
  const _$TypeSignImpl(
      {required this.id,
      required this.displayedName,
      required this.description,
      required this.color,
      required this.foregroundColor})
      : super._();

  factory _$TypeSignImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeSignImplFromJson(json);

  @override
  final String id;
  @override
  final String displayedName;
  @override
  final String description;
  @override
  final String color;
  @override
  final String foregroundColor;

  @override
  String toString() {
    return 'TypeSign(id: $id, displayedName: $displayedName, description: $description, color: $color, foregroundColor: $foregroundColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeSignImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayedName, displayedName) ||
                other.displayedName == displayedName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.foregroundColor, foregroundColor) ||
                other.foregroundColor == foregroundColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, displayedName, description, color, foregroundColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeSignImplCopyWith<_$TypeSignImpl> get copyWith =>
      __$$TypeSignImplCopyWithImpl<_$TypeSignImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeSignImplToJson(
      this,
    );
  }
}

abstract class _TypeSign extends TypeSign {
  const factory _TypeSign(
      {required final String id,
      required final String displayedName,
      required final String description,
      required final String color,
      required final String foregroundColor}) = _$TypeSignImpl;
  const _TypeSign._() : super._();

  factory _TypeSign.fromJson(Map<String, dynamic> json) =
      _$TypeSignImpl.fromJson;

  @override
  String get id;
  @override
  String get displayedName;
  @override
  String get description;
  @override
  String get color;
  @override
  String get foregroundColor;
  @override
  @JsonKey(ignore: true)
  _$$TypeSignImplCopyWith<_$TypeSignImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
