import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newblog/controller/blog_conteroller.dart';
import 'package:newblog/databases/sqlite/blog_data.dart';
import 'package:newblog/databases/sqlite/local_controller/blog_controller.dart';
import 'package:newblog/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>BlogController());
    return GetBuilder<BlogController>(
      builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:  SplashScreen(),
        );
      }
    );
  }
}