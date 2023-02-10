import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'locations.g.dart';

@Entity()
@JsonSerializable()
class Location {
  @Id(assignable: true)
  int? locationId;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? id;

  String? name;

  List<String>? properties;

  Location({this.id, this.name, this.properties, this.locationId = 0});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
