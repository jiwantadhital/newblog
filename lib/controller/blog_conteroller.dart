import 'dart:convert';

import 'package:get/get.dart';
import 'package:newblog/model/blog_model.dart';
import 'package:http/http.dart' as http;

class BlogController extends GetxController{
  List<BlogModel> blogModel = [];


Future<void> getBlog()async{
var response = await http.get(Uri.parse("https://mocki.io/v1/83c09209-c301-4336-b262-7fbd600dfe25"));
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


}