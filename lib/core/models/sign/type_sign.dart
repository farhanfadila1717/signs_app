import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_sign.freezed.dart';
part 'type_sign.g.dart';

@freezed
class TypeSign with _$TypeSign {
  const TypeSign._();

  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TypeSign({
    required String id,
    required String displayedName,
    required String description,
    required String color,
    required String foregroundColor,
  }) = _TypeSign;

  factory TypeSign.fromJson(Map<String, dynamic> json) =>
      _$TypeSignFromJson(json);
}
