import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';
part 'user.g.dart';

@JsonSerializable()
@Entity()
class User {
  @Id(assignable: true)
  int uId;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? userId;
  String? fname;
  String? lname;
  String? username;
  String? password;
  String? gender;

  User({
    this.userId,
    this.fname,
    this.lname,
    this.username,
    this.password,
    this.uId = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
