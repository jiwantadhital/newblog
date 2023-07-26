import 'package:newblog/databases/sqlite/loca_model/blog_local_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';


class BlogDatabase {

static  BlogDatabase instance = BlogDatabase._init();

static Database? _database;
BlogDatabase._init();


Future<Database> get database async{
  if(_database != null) return _database!;
  _database = await _initDB("newBlogs");
  return _database!;
}

Future<Database> _initDB(String filePath) async{
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, filePath);
  return openDatabase(path,
  version: 1,
  onCreate: _createDB
  );
}

Future _createDB(Database db, int version)async{
await db.execute(BlogModelDatabase.tableCreation);
}

}