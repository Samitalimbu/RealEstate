// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyModel _$PropertyModelFromJson(Map<String, dynamic> json) =>
    PropertyModel(
      user: json['user'] as String?,
      address: json['address'] as String?,
      squareFeet: json['squareFeet'] as int?,
      bedrooms: json['bedrooms'] as int?,
      bathrooms: json['bathrooms'] as int?,
      price: json['price'] as int?,
      locationId: json['location_id'] as String?,
      propertyId: json['propertyId'] as int? ?? 0,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$PropertyModelToJson(PropertyModel instance) =>
    <String, dynamic>{
      'propertyId': instance.propertyId,
      '_id': instance.id,
      'user': instance.user,
      'address': instance.address,
      'squareFeet': instance.squareFeet,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'price': instance.price,
      'location_id': instance.locationId,
    };
