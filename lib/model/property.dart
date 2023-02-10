import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'property.g.dart';

@Entity()
@JsonSerializable()
class PropertyModel {
  @Id(assignable: true)
  int? propertyId;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? id;

  String? user;
  String? address;
  int? squareFeet;
  int? bedrooms;
  int? bathrooms;
  int? price;

  @JsonKey(name: 'location_id')
  String? locationId;

  PropertyModel({
    this.user,
    this.address,
    this.squareFeet,
    this.bedrooms,
    this.bathrooms,
    this.price,
    this.locationId,
    this.propertyId = 0,
    this.id,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyModelToJson(this);
}
