// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppStateImpl _$$AppStateImplFromJson(Map<String, dynamic> json) =>
    _$AppStateImpl(
      authState: json['auth_state'] == null
          ? const AuthenticationState()
          : AuthenticationState.fromJson(
              json['auth_state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppStateImplToJson(_$AppStateImpl instance) =>
    <String, dynamic>{
      'auth_state': instance.authState,
    };
