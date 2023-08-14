import 'dart:convert';

import 'package:get/get.dart';
import 'package:newblog/dependencies/constants.dart';
import 'package:newblog/model/blog_model.dart';
import 'package:newblog/model/cat_model.dart';
import 'package:http/http.dart'as http;

class CatController extends GetxController{
  bool catLoading = false;
   List<CatModel> catModel = [];


Future<void> getCat()async{
  catLoading = true;
  update();
var response = await http.get(Uri.parse("${Constants.apiValue}api/getCats"));
if(response.statusCode == 200){
  print(response.body);
catModel = [];
var responseData = jsonDecode(response.body);
var data = List<CatModel>.from(responseData.map((e)=>CatModel.fromJson(e)));
catModel.addAll(data);
update();
catLoading = false;
update();
}
else{
  update();
catLoading = false;
  print("error");
}

}


//blog by category
bool blogLoading = false;
  List<BlogModel> allBlogs = [];


Future<void> getBlogByCat({required id})async{
  blogLoading=true;
  update();
var response = await http.get(Uri.parse("${Constants.apiValue}api/getBlogss/$id"));
if(response.statusCode == 200){
allBlogs = [];
print(response.body);
var responseData = jsonDecode(response.body);
var data = List<BlogModel>.from(responseData.map((e)=>BlogModel.fromJson(e)));
allBlogs.addAll(data);
update();

blogLoading=false;
update();
}
else{
  blogLoading=false;
update();
  print("error");
}

}
}