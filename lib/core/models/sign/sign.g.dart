// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignImpl _$$SignImplFromJson(Map<String, dynamic> json) => _$SignImpl(
      name: json['name'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$SignImplToJson(_$SignImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'type': instance.type,
    };
