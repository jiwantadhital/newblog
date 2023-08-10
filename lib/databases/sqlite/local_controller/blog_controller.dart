
import 'package:get/get.dart';
import 'package:newblog/databases/sqlite/blog_data.dart';
import 'package:newblog/databases/sqlite/loca_model/blog_local_model.dart';

class BlogTableController extends GetxController{
final BlogDatabase blogDatabase;
BlogTableController({required this.blogDatabase});
List<BlogModelDatabase> blogDatas = [];
bool loading = false;

Future saveBlogs(BlogModelDatabase blogDatas)async{
  loading = true;
  update();
  final db = await blogDatabase.database;
  try{
  await db.insert(tableBlog, blogDatas.toJson());
  loading=false;
  update();
  }
  catch(e){
    loading=false;
    update();
    print(e);
  }
}

Future<void> getBlogs()async{
final db = await blogDatabase.database;
final result = await db.query(tableBlog, orderBy: "${BlogFields.id} ASC");
blogDatas = [];
update();
blogDatas.addAll(result.map((json)=>BlogModelDatabase.fromJson(json)).toList());
update();
}

Future<bool> deleteBlog(mainid)async{
final db = await blogDatabase.database;
try{
await db.delete(tableBlog,where: '${BlogFields.id} = ?',whereArgs: [mainid]);
return true;
}
catch(e){
  print("error");
  return false;
}
}


}