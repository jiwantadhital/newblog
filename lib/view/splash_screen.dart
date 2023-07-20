import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newblog/view/bottom_navigate/bottom_navigate.dart';
import 'package:newblog/view/home_pages/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


@override
  void initState() {
    _startDelay();
    super.initState();
  }

_startDelay()async{
  Timer(Duration(seconds: 3), _goNext);
}

_goNext(){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
    return BottomBarApp();
  }), (route) => false);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/logoblog.png"))
                ),
              ),
              SizedBox(
                height: 60,
              ),
              CircularProgressIndicator(color: Colors.purple,)
          ],
        ),
      ),
    );
  }
}