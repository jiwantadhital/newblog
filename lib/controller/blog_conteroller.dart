import 'dart:convert';

import 'package:get/get.dart';
import 'package:newblog/dependencies/constants.dart';
import 'package:newblog/model/blog_model.dart';
import 'package:http/http.dart' as http;
import 'package:newblog/model/category_model.dart';

class BlogController extends GetxController{
  List<BlogModel> blogModel = [];


Future<void> getBlog()async{
var response = await http.get(Uri.parse("${Constants.apiValue}api/getBlogs"));
if(response.statusCode == 200){
blogModel = [];
var responseData = jsonDecode(response.body);
var data = List<BlogModel>.from(responseData.map((e)=>BlogModel.fromJson(e)));
blogModel.addAll(data);
update();
}
else{
  print("error");
}

}


//get Categories
  List<CategoriesModel> categoriesModel = [];


Future<void> getCategories()async{
var response = await http.get(Uri.parse("${Constants.apiValue}api/getCats"));
if(response.statusCode == 200){
categoriesModel = [];
var responseData = jsonDecode(response.body);
var data = List<CategoriesModel>.from(responseData.map((e)=>CategoriesModel.fromJson(e)));
categoriesModel.addAll(data);
update();
}
else{
  print("error");
}

}


}