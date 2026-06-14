// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String?,
  expiresIn: (json['expires_in'] as num?)?.toInt(),
  createdAt: (json['created_at'] as num?)?.toInt(),
);

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'created_at': instance.createdAt,
    };
