// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticationStateImpl _$$AuthenticationStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthenticationStateImpl(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthenticationStateImplToJson(
        _$AuthenticationStateImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
