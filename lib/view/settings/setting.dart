import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:newblog/databases/shared_pref/shared.dart';
import 'package:newblog/databases/sqlite/local_controller/blog_controller.dart';
import 'package:newblog/view/auth_pages/login_page.dart';
import 'package:newblog/view/home_pages/main_page.dart';
import 'package:newblog/view/settings/add_blogs.dart';
import 'package:newblog/view/settings/downloaded.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(name: "Settings", color: Colors.white, size: 20, weight: FontWeight.bold),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(width: 3,color: Colors.grey[300]!)
                ),
                child: Center(child: CustomText(color: Colors.white,name: "U",size: 34,weight: FontWeight.bold,)),
              ),

              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.find<BlogTableController>().getBlogs().then((value) {
                          Get.to(()=>Downloaded());
                        });
                        
                      },
                      child: CustomText(color: Colors.black,name: "Downloaded",size: 18,weight: FontWeight.bold,)),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
             UserSimplePreferences.userIsLoggedIn()==true? Column(
                children: [
                  Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                 
                        Get.to(AddBlogs());
                      },
                      child: CustomText(color: Colors.black,name: "Add Blogs",size: 18,weight: FontWeight.bold,)),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
               Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                   showModalBottomSheet(
                    isScrollControlled: true,
                    context: context, builder: (context){
                    return Container(
                      padding: EdgeInsets.all(10),
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(name: "Log Out?", color: Colors.red, size: 20, weight: FontWeight.w500),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [ 
                              GestureDetector(
                                onTap: (){
                                  UserSimplePreferences.logOut().then((value) {
                                        Get.to(LoginPage());
                                  });
                              
                                },
                                child: CustomText(name: "Yes", color: Colors.red, size: 20, weight: FontWeight.w500)),
                              CustomText(name: "No", color: Colors.red, size: 20, weight: FontWeight.w500),
                            ],
                          )
                        ],
                      ),
                    );
                   });
                        
                      },
                      child: CustomText(color: Colors.red,name: "Logout",size: 18,weight: FontWeight.bold,)),
                    Icon(Icons.arrow_forward_ios_outlined,color: Colors.red,)
                  ],
                ),
              )
                ],
              ):Container(
                margin: EdgeInsets.only(top: 30),
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      Get.to(LoginPage());
                      print(UserSimplePreferences.getUserToken());
                    },
                    child: CustomText(color: Colors.white,name: "Login",size: 18,weight: FontWeight.bold,)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}