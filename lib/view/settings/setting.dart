import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:newblog/databases/sqlite/local_controller/blog_controller.dart';
import 'package:newblog/view/home_pages/main_page.dart';
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

              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.all(10),
                height: 60,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}