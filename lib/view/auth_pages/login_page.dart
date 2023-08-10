import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:newblog/controller/authController.dart';
import 'package:newblog/databases/shared_pref/shared.dart';
import 'package:newblog/view/bottom_navigate/bottom_navigate.dart';
import 'package:newblog/view/home_pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
bool hidepassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CustomText(name: "Please Login", color: Colors.black, size: 30, weight: FontWeight.bold),
            SizedBox(height: 40,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              obscureText: hidepassword,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: GestureDetector(
                  onTap: (){
                    hidepassword = !hidepassword;
                    setState(() {
                      
                    });
                  },
                  child: Icon(Icons.remove_red_eye)),
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 40,),
            Container(
              height: 60,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: GestureDetector(
                  onTap: (){
                    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                      Get.find<AuthController>().userLogin(emailController.text, passwordController.text).then((value) => {
                        if(value.message=="successfull"){
                          print(value.token),
                          UserSimplePreferences.setUserToken(value.token.toString()).then((value) {
                                                     Get.offAll(BottomBarApp());
                          }),
                        }
                      });
                    }
                  },
                  child: GetBuilder<AuthController>(
                    builder: (auth) {
                      return CustomText(name: auth.loading==false? "Login":"Loading....", color: Colors.white, size: 20, weight: FontWeight.bold);
                    }
                  )),
              ),
            )
          ],
        ),
      ),
    );
  }
}