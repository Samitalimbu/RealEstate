import 'dart:io';

import 'package:first/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

import '../model/user.dart';

class ObjectBoxInstance {
  late final Store _store;
  late final Box<User> _user;

  ObjectBoxInstance(this._store) {
    _user = Box<User>(_store);
  }

  static Future<ObjectBoxInstance> init() async {
    var dir = await getApplicationDocumentsDirectory();
    final store = Store(
      getObjectBoxModel(),
      directory: '${dir.path}/user_details',
    );
    return ObjectBoxInstance(store);
  }

  static Future<void> deleteDatabase() async {
    var dir = await getApplicationDocumentsDirectory();
    Directory('${dir.path}/user_details').deleteSync(recursive: true);
  }

  int addUser(User user) {
    return _user.put(user);
  }

  List<User> getAllUser() {
    return _user.getAll();
  }

  User? loginUser(String username, String password) {
    return _user
        .query(
            User_.username.equals(username) & User_.password.equals(password))
        .build()
        .findFirst();
  }
}
