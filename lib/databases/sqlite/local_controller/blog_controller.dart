
import 'package:get/get.dart';
import 'package:newblog/databases/sqlite/blog_data.dart';
import 'package:newblog/databases/sqlite/loca_model/blog_local_model.dart';

class BlogTableController extends GetxController{
final BlogDatabase blogDatabase;
BlogTableController({required this.blogDatabase});
List<BlogModelDatabase> blogDatas = [];

Future saveBlogs(blogDatas)async{
  final db = await blogDatabase.database;
  await db.insert(tableBlog, blogDatas);
  update();
}

Future<void> getBlogs()async{
final db = await blogDatabase.database;
final result = await db.query(tableBlog, orderBy: "${BlogFields.id} ASC");
blogDatas = [];
update();
blogDatas.addAll(result.map((json)=>BlogModelDatabase.fromJson(json)).toList());
update();
}

}