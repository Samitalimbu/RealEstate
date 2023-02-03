import 'dart:io';

import 'package:first/data_source/local_data_source/user_data_source.dart';

import '../data_source/user_remote_data_source.dart';
import '../model/user.dart';

abstract class UserRepository {
  Future<List<User>> getUser();

  Future<int> addUser(File? file, User user);
  Future<bool?> loginUser(String username, String password);
}

class UserRepositoryImpl extends UserRepository {
  @override
  Future<int> addUser(File? file, User user) {
    return UserRemoteDataSource().addUser(file, user);
  }

  @override
  Future<List<User>> getUser() {
    return UserDataSource().getUser();
  }

  @override
  Future<bool?> loginUser(String username, String password) async {
    return UserRemoteDataSource().loginUser(username, password);
  }
}
