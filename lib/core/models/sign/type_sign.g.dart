// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_sign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TypeSignImpl _$$TypeSignImplFromJson(Map<String, dynamic> json) =>
    _$TypeSignImpl(
      id: json['id'] as String,
      displayedName: json['displayed_name'] as String,
      description: json['description'] as String,
      color: json['color'] as String,
      foregroundColor: json['foreground_color'] as String,
    );

Map<String, dynamic> _$$TypeSignImplToJson(_$TypeSignImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayed_name': instance.displayedName,
      'description': instance.description,
      'color': instance.color,
      'foreground_color': instance.foregroundColor,
    };
