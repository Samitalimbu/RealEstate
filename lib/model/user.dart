import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id(assignable: true)
  int userId;
  String username;
  String password;
  String confirmpassword;

  User(this.username, this.password, this.confirmpassword, {this.userId = 0});
}
