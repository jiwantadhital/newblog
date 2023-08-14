import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:newblog/dependencies/constants.dart';
import 'package:http/http.dart' as http;

class AddBlogController extends GetxController{



Future<bool> addBlog(title,description, image,categories)async{
  var url = Uri.parse("${Constants.apiValue}api/addblogs");
var response = await http.MultipartRequest(
  'POST',
  url
);
response.fields['title'] = title.toString();
response.fields['description'] = description.toString();
response.fields['cat_id'] = categories.toString();

http.MultipartFile multipartFile  = await http.MultipartFile.fromPath(
  'image_file',
  image,
);
response.files.add(multipartFile);
var res = await response.send();
if(res.statusCode == 200){
  return true;
}
else{
  return false;
}

}


}