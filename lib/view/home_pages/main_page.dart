// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newblog/controller/blog_conteroller.dart';
import 'package:newblog/dependencies/constants.dart';
import 'package:newblog/notification/local_notification.dart';
import 'package:newblog/view/home_pages/details/detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
@override
  void initState() {
    Get.find<BlogController>().getBlog();
    
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        if (message != null) {
          if (message.notification!.body != null) {

          }
        }
      },
    );
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {

        if (message.notification != null) {
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
          children: [
           TopPart(size: size),
           Blogs(size: size)
          ],
        ),
    );
  }
}

class Blogs extends StatelessWidget {
  const Blogs({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogController>(
      builder: (blog) {
        return Expanded(
          child: GridView.builder(
           shrinkWrap: true,
           itemCount: blog.blogModel.length,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisSpacing: 5,
             childAspectRatio: 1/1.3,
             crossAxisCount: 2,
             ),
           itemBuilder: (context,index){
             return Container(
               margin: EdgeInsets.all(5),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   GestureDetector(
                    onTap: (){
                         Get.to(Details(blogDetail: blog.blogModel[index],));
                    },
                     child: Container(
                       height: 160,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                         image: DecorationImage(image: 
                         NetworkImage("${Constants.apiValue}/public/uploads/images/Blog/${blog.blogModel[index].image.toString()}"),fit: BoxFit.cover)
                       ),
                     ),
                   ),
                   SizedBox(height: 5,),
                   CustomText(name: blog.blogModel[index].category!.title.toString(), color: Colors.grey, size: 18, weight: FontWeight.normal),
                   Container(
                     width: size.width*0.45,
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: CustomText(name: blog.blogModel[index].title.toString(),
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
    );
  }
}

class TopPart extends StatefulWidget {
 var size;
   TopPart({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  State<TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {
  int currentIndex = 0;
  int item = 4;
  @override
  Widget build(BuildContext context) {
    return  Container(
              height: widget.size.height*0.42,
              width: widget.size.width,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: item,
                    onPageChanged: (value) {
                      currentIndex=value;
                      setState(() {
                        
                      });
                    },
                    itemBuilder: (context,index){
                      return Container(
                        height: widget.size.height*0.45,
                      width: widget.size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/img.jpeg"),fit: BoxFit.cover)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          CustomText(name: "New Blog",color: Colors.white,size: 22,weight: FontWeight.w600,),
                          SizedBox(height: 40,),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                              child: CustomText(name: "Travel", color: Colors.white, size: 13, weight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: widget.size.width*0.8,
                            height: 150,
                            child: Center(
                              child: CustomText(
                                maxLine: 3,
                                name: "See The Unmatched Beauty Of Great Lakes",
                               color: Color.fromARGB(255, 238, 234, 234), size: 28, weight: FontWeight.w500),
                            ),
                          ),                         
                        ],
                      ),
                      );
                     
                    }),
                     Positioned(
                      bottom: 0,
                      left: widget.size.width*0.40,
                      child:  Container(height: 30,
                          child: DotsIndicator(
                            position: currentIndex,
                            dotsCount: item,
                            decorator: DotsDecorator(
                              color:Colors.white,
                              activeColor: Color.fromARGB(255, 65, 16, 151)
                            ),
                            ),
                          ))
                ],
              ),
            );
  }
}

class CustomText extends StatelessWidget {
  int maxLine;
String name;
Color color;
double size;
TextAlign align;
FontWeight weight;
   CustomText({
    Key? key,
    this.maxLine=1,
    this.align=TextAlign.center,
    required this.name,
    required this.color,
    required this.size,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(name,
    maxLines: maxLine,
    textAlign: align,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight
    ),
    );
  }
}
