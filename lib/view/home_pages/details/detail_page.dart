import 'package:flutter/material.dart';
import 'package:newblog/view/home_pages/main_page.dart';

class Details extends StatefulWidget {
  const Details({super.key});

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
            DetailsTop(size: size),
            DetailsBottom(size: size)
          ],
        ),
      ),
    );
  }
}


//details bottom
class DetailsBottom extends StatefulWidget {
  const DetailsBottom({
    super.key,
    required this.size,
  });

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
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(name: "Success Steps For Your Personal Life", color: Colors.black, size: 17, weight: FontWeight.bold)
                          ,SizedBox(height: 5,),
                        CustomText(
                          align: TextAlign.start,
                          maxLine: 18,
                          name: "The success of your life depends on yourself as conducted by theresearch of the university on yourself as conducted by theresearch of the university on yourself as conducted by theresearch of the university on yourself as conducted by theresearch of the university on yourself as conducted by theresearch of the university on yourself as conducted by theresearch of the university on yourself as conducted by theresearch of the university on yourself as conducted by theresearch of the university on yourself as conducted by theresearch of the university on yourself as conducted by theresearch of the university on yourself as conducted by theresearch of the university  on yourself as conducted by theresearch of the university of penselveniya.The data shows that the quality of life depends on all the things you", color: Colors.black, size: 17, weight: FontWeight.normal)

                          ],
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
  const DetailsTop({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: size.height*0.35,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: 
        AssetImage("assets/images/ban.png"),fit: BoxFit.cover)
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