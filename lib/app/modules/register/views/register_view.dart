// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/app/modules/loggin/views/loggin_view.dart';
import 'package:login/app/user_detail.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = RegisterController();
    final sWidth = MediaQuery.of(context).size.width;
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
                  "Register",
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
                        "Username",
                        style: TextStyle(
                            fontSize: sWidth * 0.06,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: controller.usernamecon,
                        onChanged: controller.validateUsername,
                        decoration: InputDecoration(
                          hintText: "Username",
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
                      ),
                      Obx(() => Text(
                            controller.usernameError.value,
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
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
                        controller: controller.emailcon,
                        onChanged: controller.validateEmail,
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
                      ),
                      Obx(() => Text(
                            controller.emailError.value,
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                        controller: controller.passwordcon,
                        onChanged: controller.validatePassword,
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
                      ),
                      Obx(() => Text(
                            controller.passwordError.value,
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Confirm Password",
                        style: TextStyle(
                            fontSize: sWidth * 0.06,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: controller.conpasswordcon,
                        onChanged: controller.validateConfirmPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
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
                      ),
                      Obx(() => Text(
                            controller.confirmPasswordError.value,
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: sWidth * 0.9,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                          colors: [Colors.red, Colors.black])),
                  child: ElevatedButton(
                    onPressed: controller.registerUser,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(LogginView());
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.blue),
                      ),
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
