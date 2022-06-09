// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) => Register(
      json['email'] as String?,
      json['name'] as String?,
      json['password'] as String?,
    );

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
    };
