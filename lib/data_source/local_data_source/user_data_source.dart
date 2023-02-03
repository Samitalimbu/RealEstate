
import '../../helper/objectbox.dart';
import '../../model/user.dart';
import '../../state/objectbox_state.dart';

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

  Future<List<User>> getUser() async {
    try {
      return objectBoxInstance.getAllUser();
    } catch (e) {
    return [];
    }
  }

  // int deleteUser(){
  //   try{ return objectBoxInstance.deleteUser();
  //   } catch (e){
  //     return 0;
  //   }
   
  // }

  Future<bool> loginUser(String username, String password) async {
     try {
      if (objectBoxInstance.loginUser(username, password) != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Error occured : ${e.toString()}');
    }
  }
}