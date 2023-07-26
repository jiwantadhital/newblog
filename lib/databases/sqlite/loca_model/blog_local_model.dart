// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:newblog/databases/sqlite/data_types.dart';

String tableBlog = "blogs";
class BlogFields{

static final List<String> values = [id,title,desc,catid,image,cattitle];

static const String id = "_id";
static const String title = "_title";
static const String desc = "_desc";
static const String catid = "_catid";
static const String image = "_image";
static const String cattitle = "_cattitle";

}

class BlogModelDatabase {
int? id;
String title;
String desc;
int catid;
String image;
String cattitle;
  BlogModelDatabase({
    this.id,
    required this.title,
    required this.desc,
    required this.catid,
    required this.image,
    required this.cattitle,
  });


  BlogModelDatabase copyWith({
    int? id,
    String? title,
    String? desc,
    int? catid,
    String? image,
    String? cattitle,
  }) {
    return BlogModelDatabase(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      catid: catid ?? this.catid,
      image: image ?? this.image,
      cattitle: cattitle ?? this.cattitle,
    );
  }



  static BlogModelDatabase fromJson(Map<String, Object?> json)=>
  BlogModelDatabase(
    id: json[BlogFields.id] as int?,
    title: json[BlogFields.title] as String,
    desc: json[BlogFields.desc] as String,
    catid: json[BlogFields.catid] as int,
    image: json[BlogFields.image] as String,
    cattitle: json[BlogFields.cattitle] as String);
Map<String,Object?> toJson()=>{
  BlogFields.id:id,
  BlogFields.title:title,
  BlogFields.desc:desc,
  BlogFields.catid:catid,
  BlogFields.image:image,
  BlogFields.cattitle:cattitle

};

static String tableCreation = '''
CREATE TABLE $tableBlog(
  ${BlogFields.id} $idType,
  ${BlogFields.title} $textType,
  ${BlogFields.desc} $textType,
  ${BlogFields.catid} $integerTpe,
  ${BlogFields.image} $textType,
  ${BlogFields.cattitle} $textType
)
''';


}
