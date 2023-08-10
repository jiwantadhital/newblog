import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newblog/controller/add_blog_controller.dart';
import 'package:newblog/view/home_pages/main_page.dart';

class AddBlogs extends StatefulWidget {
  const AddBlogs({super.key});

  @override
  State<AddBlogs> createState() => _AddBlogsState();
}

class _AddBlogsState extends State<AddBlogs> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  File? image;
  String imagePath = "";

Future picImageCamera()async{
  try{
    final image = await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 10);

    if(image==null) return;
    final imageTempro = File(image.path);
        print(image.path);
    imagePath = image.path;
    setState(() {
      
    });
  }
  on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
}
Future picImageGallery()async{
  try{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 10);
    if(image==null) return;
    final imageTempro = File(image.path);
    print(image);
  }
  on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Blogs"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: descController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Desc",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  picImageCamera();
                  setState(() {
                    
                  });
                }, child: Text("Pick Camera")),
                SizedBox(height: 20,),
                 ElevatedButton(onPressed: (){
                  picImageGallery();
                }, child: Text("Pick Gallery")),
                SizedBox(height: 20,),
                Container(
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
                        
                        Get.find<AddBlogController>().addBlog(titleController.text, descController.text, imagePath).then((value) => {
                          if(value==true){
                            print("Succeds")
                          }
                          else{
                            print("Failure")
                          }
                        });
                      },
                      child: CustomText(color: Colors.white,name: "Submit",size: 18,weight: FontWeight.bold,)),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}