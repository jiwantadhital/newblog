import 'dart:convert';

import 'package:get/get.dart';
import 'package:newblog/dependencies/constants.dart';
import 'package:newblog/model/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController{
LoginModel loginModel = LoginModel();
bool loading = false;

Future<LoginModel> userLogin(String email, String password)async{
  loading=true;
  update();
var response = await http.post(Uri.parse("${Constants.apiValue}api/login"),
headers: {
  "Content-Type" : "application/json"
},
body: jsonEncode({
  "email": email,
  "password" : password
}),
);
print(response.statusCode);
var loginData = jsonDecode(response.body);
if(response.statusCode==200){
  loading=false;
  update();
  loginModel = LoginModel.fromJson(loginData); 
  update();
  return loginModel;
}
else{
loading=false;
update();
  return loginModel;
}


}

}