import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:newblog/databases/sqlite/local_controller/blog_controller.dart';
import 'package:newblog/view/home_pages/details/detail_page.dart';
import 'package:newblog/view/home_pages/main_page.dart';

class Downloaded extends StatefulWidget {
  const Downloaded({super.key});

  @override
  State<Downloaded> createState() => _DownloadedState();
}

class _DownloadedState extends State<Downloaded> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(name: "Downloaded", color: Colors.white, size: 20, weight: FontWeight.bold),
      ),
      body: GetBuilder<BlogTableController>(
      builder: (blog) {
        return blog.blogDatas.isEmpty?Center(child: CustomText(name: "No downloads", color: Colors.black, size: 20, weight: FontWeight.bold)): GridView.builder(
         shrinkWrap: true,
         itemCount: blog.blogDatas.length,
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisSpacing: 5,
           childAspectRatio: 1/1.3,
           crossAxisCount: 2,
           ),
         itemBuilder: (context,index){
           return Container(
             margin: EdgeInsets.all(5),
             child: Stack(
               children: [
                
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     GestureDetector(
                      onTap: (){
                          //  Get.to(Details(blogDetail: blog.blogDatas[index],));
                      },
                       child: Container(
                         height: 160,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                           image: DecorationImage(image: 
                           NetworkImage(blog.blogDatas[index].image.toString()),fit: BoxFit.cover)
                         ),
                       ),
                     ),
                     SizedBox(height: 5,),
                     CustomText(name: blog.blogDatas[index].cattitle, color: Colors.grey, size: 18, weight: FontWeight.normal),
                     Container(
                       width: size.width*0.45,
                       child: Align(
                         alignment: Alignment.topLeft,
                         child: CustomText(name: blog.blogDatas[index].title.toString(),
                                                       align: TextAlign.start,
                          color: Colors.black, size: 17, weight: FontWeight.w700,maxLine: 2,),
                       ),
                     )
                   ],
                 ),
                 Positioned(
                  right: 0,
                   child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: (){
                        blog.deleteBlog(blog.blogDatas[index].id).then((value) {
                          blog.getBlogs();
                          setState(() {
                            
                          });
                         });
                        },
                        child: Icon(Icons.delete,color: Colors.white,)),
                    ),
                                 ),
                 ),
               ],
             ),
           );
         });
      }
    ),
    );
  }
}