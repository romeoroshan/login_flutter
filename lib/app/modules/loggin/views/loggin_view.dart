import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loggin_controller.dart';

class LogginView extends GetView<LogginController> {
  const LogginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('bg.jpg'), fit: BoxFit.cover)),
        child: Container(
          width: sWidth,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(118, 0, 0, 0),
            Color.fromARGB(56, 244, 67, 54)
          ])),
          child: Padding(
            padding: EdgeInsets.all(sWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                      fontSize: sWidth * 0.11,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: sWidth * 0.06,
                            fontWeight: FontWeight.w600,
                            
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          
                          hintText: "Email",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 200, 199, 199)),
                          border: OutlineInputBorder(
                            
                            borderSide:
                                const BorderSide(width: 0, color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                            
                          ),
                          focusColor: Colors.red,
                          fillColor: const Color.fromARGB(127, 158, 158, 158),
                          filled: true,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                            fontSize: sWidth * 0.06,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 200, 199, 199)),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 0, color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: const Color.fromARGB(127, 158, 158, 158),
                          filled: true,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: const Checkbox(
                    value: true,
                    onChanged: null,
                  ),
                  title: const Text(
                    "Remember me",
                    style: TextStyle(color: Colors.white60),
                  ),
                  trailing: Text(
                    "Forgot password",
                    style: TextStyle(
                        color: Colors.white60, fontSize: sWidth * 0.03),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: sWidth * 0.9,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient:
                          const LinearGradient(colors: [Colors.red, Colors.black])),
                  child: ElevatedButton(
                    onPressed: () {},
                    
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Colors.transparent),
                        child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: sWidth * 0.3,
                      height: 2,
                      color: Colors.grey,
                    ),
                    const Text(
                      "Or login with",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Container(
                      width: sWidth * 0.3,
                      height: 2,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: sWidth * .2,
                      height: 50,
                      
                      decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(8),color: Colors.grey,),
                      child: const Icon(Icons.apple),
                    ),
                    Container(
                      width: sWidth * .2,
                      height: 50,
                      
                      decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(8),color: Colors.grey,),
                      child: const Icon(Icons.android_rounded),
                    ),
                    Container(
                      width: sWidth * .2,
                      height: 50,
                      
                      decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(8),color: Colors.grey,),
                      child: const Icon(Icons.ac_unit),
                    ),
                  ],
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? ",style: TextStyle(color: Colors.grey),),
                    InkWell(
                      onTap: () {
                        
                      },
                      child: const Text("Sign-up",style: TextStyle(color: Colors.blue),),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
