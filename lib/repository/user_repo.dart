import '../data_source/user_data_source.dart';
import '../model/user.dart';

abstract class UserRepository {
  Future<List<User>> getUser();

  Future<int> addUser(User user);
  Future<User?> loginUser(String username, String password);
}

class UserRepositoryImpl extends UserRepository {
  @override
  Future<int> addUser(User user) {
    return UserDataSource().addUser(user);
  }

  @override
  Future<List<User>> getUser() {
    return UserDataSource().getAllUser();
  }

  @override
  Future<User?> loginUser(String username, String password) {
    return UserDataSource().loginUser(username, password);
  }
}
