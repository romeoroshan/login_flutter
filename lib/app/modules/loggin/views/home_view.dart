import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeView extends GetView {
  final String name;
  const HomeView({Key? key,required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double sWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage('bg.jpg'), fit: BoxFit.cover),
        ),
        child: Container(
          width: sWidth,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(118, 0, 0, 0),
              Color.fromARGB(56, 244, 67, 54)
            ]),
          ),
          child: Center(
            child: Text("Hello $name",style: TextStyle(color: Colors.white,fontSize: 50),),
          ),
        ),
      ),
    );
  }
}
