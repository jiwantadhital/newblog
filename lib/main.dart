import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newblog/controller/add_blog_controller.dart';
import 'package:newblog/controller/authController.dart';
import 'package:newblog/controller/blog_conteroller.dart';
import 'package:newblog/controller/cat_controller.dart';
import 'package:newblog/databases/shared_pref/shared.dart';
import 'package:newblog/databases/sqlite/blog_data.dart';
import 'package:newblog/databases/sqlite/loca_model/blog_local_model.dart';
import 'package:newblog/databases/sqlite/local_controller/blog_controller.dart';
import 'package:newblog/view/auth_pages/login_page.dart';
import 'package:newblog/view/splash_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await UserSimplePreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>BlogController());
    Get.lazyPut(()=>CatController());
     Get.lazyPut(()=>AuthController());
     Get.lazyPut(()=>AddBlogController());
                         Get.find<CatController>().getCat();
                         

     Get.lazyPut(()=>BlogTableController(blogDatabase: BlogDatabase.instance));
    return GetBuilder<AddBlogController>(
      builder: (_) {
        return GetBuilder<CatController>(
          builder: (_) {
            return GetBuilder<AuthController>(
              builder: (context) {
                return GetBuilder<BlogTableController>(
                  builder: (_) {
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
                );
              }
            );
          }
        );
      }
    );
  }
}