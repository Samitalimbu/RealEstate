// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      locationId: json['locationId'] as int? ?? 0,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'locationId': instance.locationId,
      '_id': instance.id,
      'name': instance.name,
      'properties': instance.properties,
    };
