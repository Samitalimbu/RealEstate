import '../../model/user.dart';
import '../helper/objectbox.dart';
import '../state/objectbox_state.dart';

class UserDataSource {
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;
  //OR

  // ObjectBoxInstance objectBoxInstance2= ObjectBoxState.objectBoxInstance!;

  Future<int> addUser(User user) async {
    try {
      return objectBoxInstance.addUser(user);
    } catch (e) {
      return Future.value(0);
    }
  }

  Future<List<User>> getAllUser() async {
    try {
      return objectBoxInstance.getAllUser();
    } catch (e) {
      return [];
    }
  }

  Future<User> loginUser(String username, String password) {
    try {
      return Future.value(objectBoxInstance.loginUser(username, password));
    } catch (e) {
      return Future.value(null);
    }
  }
}
