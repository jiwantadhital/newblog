import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:newblog/controller/blog_conteroller.dart';
import 'package:newblog/controller/cat_controller.dart';
import 'package:newblog/dependencies/constants.dart';
import 'package:newblog/view/home_pages/details/detail_page.dart';
import 'package:newblog/view/home_pages/main_page.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int currentIndex  = 0;
  @override
  void initState() {
      Get.find<CatController>().getBlogByCat(id: Get.find<CatController>().catModel[0].id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.deepPurple,
        title: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: GetBuilder<CatController>(
            builder: (categories) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.catModel.length,
                itemBuilder: (context,index){
                return Center(
                  child: GestureDetector(
                    onTap: (){
                      currentIndex=index;
                      setState(() {
                        categories.getBlogByCat(id: categories.catModel[index].id);
                               print(categories.catModel[index].id);
                        // print(categories.blogModel[0].title);
                 
                    
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      margin: EdgeInsets.only(left: 10,right: 10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: currentIndex==index?Colors.purple: Colors.deepPurple,
                        border: Border.all(
                          color: Colors.white,
                          width: 3
                        ),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: CustomText(name: categories.catModel[index].title??"",
                         color: Colors.white, size: 16, weight: FontWeight.w500),
                      ),
                    ),
                  ),
                );
              });
            }
          ),
        )
      ),
      body: GetBuilder<CatController>(
      builder: (cat) {

        return Container(
          height: size.height,
          width: size.width,
          child: GridView.builder(
           shrinkWrap: true,
           itemCount: cat.allBlogs.length,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisSpacing: 5,
             childAspectRatio: 1/1.3,
             crossAxisCount: 2,
             ),
           itemBuilder: (context,index){
            print(cat.allBlogs[index].title);
             return Container(
               margin: EdgeInsets.all(5),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   GestureDetector(
                    onTap: (){
                       
                         Get.to(Details(blogDetail: cat.allBlogs[index],));
                    },
                     child: Container(
                       height: 160,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                         image: DecorationImage(image: 
                         NetworkImage("${Constants.apiValue}/public/uploads/images/Blog/${cat.allBlogs[index].image.toString()}"),fit: BoxFit.cover)
                       ),
                     ),
                   ),
                   SizedBox(height: 5,),
                  //  CustomText(name: cat.allBlogs[index].category!.title.toString(), color: Colors.grey, size: 18, weight: FontWeight.normal),
                   Container(
                     width: size.width*0.45,
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: CustomText(name: cat.allBlogs[index].title.toString(),
                                                     align: TextAlign.start,
                        color: Colors.black, size: 17, weight: FontWeight.w700,maxLine: 2,),
                     ),
                   )
                 ],
               ),
             );
           }),
        );
      }
    ),
    );
  }
}