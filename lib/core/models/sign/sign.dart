import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign.freezed.dart';
part 'sign.g.dart';

@freezed
class Sign with _$Sign {
  const Sign._();

  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Sign({
    required String name,
    required String image,
    required String description,
    required String type,
  }) = _Sign;

  factory Sign.fromJson(Map<String, dynamic> json) => _$SignFromJson(json);
}
