import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;

  static const _usertoken = 'USERTOKEN';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();




   static Future setUserToken(String userToken) async {
    await _preferences?.setString(_usertoken, userToken);
  }
  
  static userIsLoggedIn(){
    return _preferences?.containsKey(_usertoken);
  }


 static String? getUserToken() => _preferences?.getString(_usertoken);


  //remove

   static Future logOut()async{
    await _preferences?.remove(_usertoken);
  }
}