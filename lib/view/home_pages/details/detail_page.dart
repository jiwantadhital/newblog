// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:newblog/model/blog_model.dart';

import 'package:newblog/view/home_pages/main_page.dart';

class Details extends StatefulWidget {
 var blogDetail;
   Details({
    Key? key,
    required this.blogDetail,
  }) : super(key: key);
 

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            DetailsTop(size: size,blogDetails: widget.blogDetail,),
            DetailsBottom(size: size,blogDetail: widget.blogDetail,)
          ],
        ),
      ),
    );
  }
}


//details bottom
class DetailsBottom extends StatefulWidget {
   DetailsBottom({
    super.key,
    required this.size,
    required this.blogDetail
  });
  BlogModel blogDetail;
  final Size size;

  @override
  State<DetailsBottom> createState() => _DetailsBottomState();
}

class _DetailsBottomState extends State<DetailsBottom> {
  TabController? _tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        height: widget.size.height*0.65,
        width: widget.size.width,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.black,
                            indicator: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(4)),
                                onTap: (val){

                                },
              tabs: [
              Tab(
                child: Text("Description",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
              ),
              Tab( child: Text("Comment",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),),
            ]),
            Expanded(
              child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(name: widget.blogDetail.title.toString(), color: Colors.black, size: 17, weight: FontWeight.bold)
                            ,SizedBox(height: 5,),
                          CustomText(
                            size: 14,
                            weight: FontWeight.normal,
                            color: Colors.black,
                            align: TextAlign.start,
                            maxLine: 18,
                            name: widget.blogDetail.description.toString()
                            )
                    
                            ],
                        ),
                      ),
                    ),
                    Icon(Icons.directions_transit, size: 350,color: Colors.blue,),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}


//details top
class DetailsTop extends StatelessWidget {
   DetailsTop({
    super.key,
    required this.size,
    required this.blogDetails,
  });
  BlogModel blogDetails;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: size.height*0.35,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: 
        NetworkImage(blogDetails.image.toString()),fit: BoxFit.cover)
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white,width: 2)
              ),
              child: Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back,color: Colors.white,)),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white,width: 2)
              ),
               child: Center(
                child: Icon(Icons.download,color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}