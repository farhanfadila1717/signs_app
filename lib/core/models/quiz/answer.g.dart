// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      text: json['text'] as String? ?? '',
      image: json['image'] as String? ?? '',
      correct: json['correct'] as bool? ?? false,
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'image': instance.image,
      'correct': instance.correct,
    };
