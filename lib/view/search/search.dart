import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:newblog/controller/blog_conteroller.dart';
import 'package:newblog/dependencies/constants.dart';
import 'package:newblog/model/blog_model.dart';
import 'package:newblog/view/home_pages/details/detail_page.dart';
import 'package:newblog/view/home_pages/main_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchController = TextEditingController();
  List<BlogModel> blogDatas = [];


_onSearch(String text){
var all = Get.find<BlogController>().blogModel;
blogDatas = [];
if(text.isEmpty){
  setState(() {
    
  });
  return;
}
else{
  all.forEach((vall) {
    if(vall.title!.toLowerCase().contains(text.toLowerCase())){
      blogDatas.add(vall);
      setState(() {
        print(vall.title);
      });
    }
   });
}

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                onChanged: _onSearch,
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: GestureDetector(
                    onTap: (){
                      searchController.clear();
                      blogDatas.clear();
                          FocusScope.of(context).unfocus();
                    },
                    child: Icon(Icons.delete)),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child:blogDatas.isEmpty? Center(child: CustomText(name: "Please Search",
                 color: Colors.red, size: 17, 
                 weight: FontWeight.w400),) : ListView.builder(
                  shrinkWrap: true,
                  itemCount: blogDatas.length,
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width*0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: 
                              NetworkImage("${Constants.apiValue}/public/uploads/images/Blog/${blogDatas[index].image.toString()}"),fit: BoxFit.cover)
                            ),
                          ),
                          Container(
                            height: 85,
                            width: MediaQuery.of(context).size.width*0.56,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                        FocusScope.of(context).unfocus();
                                    Get.to(Details(blogDetail: blogDatas[index]));
                                  },
                                  child: CustomText(name: blogDatas[index].title??"",
                                   color: Colors.black, size: 18, weight: FontWeight.w600),
                                ),
                                 SizedBox(height: 5,),
                                 CustomText(
                                  align: TextAlign.start,
                                  maxLine: 2,
                                  name: blogDatas[index].description??"",
                                 color: Colors.black, size: 14, weight: FontWeight.w300),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}