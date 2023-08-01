import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newblog/view/home_pages/main_page.dart';
import 'package:newblog/view/search/search.dart';
import 'package:newblog/view/settings/setting.dart';

class BottomBarApp extends StatefulWidget {
  const BottomBarApp({super.key});

  @override
  State<BottomBarApp> createState() => _BottomBarAppState();
}

class _BottomBarAppState extends State<BottomBarApp> {
int currentIndex = 0;

List pages = [
MainPage(),
  Container(
    child: Center(child: Text("Category")),
  ),
  Container(
    child: SearchPage(),
  ),
   Container(
    child: Settings()
  ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (value){
          currentIndex = value;
          setState(() {
            
          });
        },
         items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home)),
             BottomNavigationBarItem(
            label: "Category",
            icon: Icon(Icons.category)),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search)),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings)),
           
        ],
        ),
    );
  }
}