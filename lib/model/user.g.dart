// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['_id'] as String?,
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      uId: json['uId'] as int? ?? 0,
    )..gender = json['gender'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uId': instance.uId,
      '_id': instance.userId,
      'fname': instance.fname,
      'lname': instance.lname,
      'username': instance.username,
      'password': instance.password,
      'gender': instance.gender,
    };
