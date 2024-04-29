import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/app/modules/loggin/views/loggin_view.dart';
import 'package:login/app/user_detail.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final TextEditingController emailcon = TextEditingController();
  final TextEditingController usernamecon = TextEditingController();
  final TextEditingController passwordcon = TextEditingController();
  final TextEditingController conpasswordcon = TextEditingController();
  final buttonDisabled = true.obs;
  final usernameError = RxString('');
  final emailError = RxString('');
  final passwordError = RxString('');
  final confirmPasswordError = RxString('');

  RegisterView({Key? key}) : super(key: key);

  void validateUsername(String value) {
    if (value.isEmpty) {
      usernameError.value = 'Username cannot be empty';
    } else if (value.length > 25) {
      usernameError.value = 'Username cannot be longer than 25 characters';
    } else {
      usernameError.value = '';
    }
    updateButtonState();
  }

  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError.value = 'Email cannot be empty';
    } else if (!GetUtils.isEmail(value)) {
      emailError.value = 'Invalid email address';
    } else {
      emailError.value = '';
    }
    updateButtonState();
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Password cannot be empty';
    } else if (value.length < 8) {
      passwordError.value = 'Password must be at least 8 characters long';
    } else if (!isStrongPassword(value)) {
      passwordError.value =
          'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character';
    } else {
      passwordError.value = '';
    }
    updateButtonState();
  }

  void validateConfirmPassword(String value) {
    final password = passwordcon.text;
    if (value.isEmpty) {
      confirmPasswordError.value = 'Please confirm your password';
    } else if (value != password) {
      confirmPasswordError.value = 'Passwords do not match';
    } else {
      confirmPasswordError.value = '';
    }
    updateButtonState();
  }

  void updateButtonState() {
    buttonDisabled.value = usernameError.isNotEmpty ||
        emailError.isNotEmpty ||
        passwordError.isNotEmpty ||
        confirmPasswordError.isNotEmpty;
  }

  bool isStrongPassword(String password) {
    final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*])');
    return regex.hasMatch(password);
  }

  @override
  void registerUser(User user) {
    final box = GetStorage();
    box.write('user', user.toJson());
  }

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('bg.jpg'), fit: BoxFit.cover)),
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
                        controller: usernamecon,
                        onChanged: validateUsername,
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
                            usernameError.value,
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
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
                        controller: emailcon,
                        onChanged: validateEmail,
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
                            emailError.value,
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
                        controller: passwordcon,
                        onChanged: validatePassword,
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
                            passwordError.value,
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
                        controller: conpasswordcon,
                        onChanged: validateConfirmPassword,
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
                            confirmPasswordError.value,
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
                      gradient:
                          const LinearGradient(colors: [Colors.red, Colors.black])),
                          
                  child:ElevatedButton(
  onPressed: () {
    if (buttonDisabled.value == true) {
      print(buttonDisabled.value);
      Get.snackbar(
        'Error',
        'Form is not valid',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      print(buttonDisabled.value);
      final usern = usernamecon.text;
      final pass = passwordcon.text;
      final em = emailcon.text;
      final user = User(username: usern, password: pass, email: em);
      registerUser(user);
      Get.to(LogginView());
    }
  },
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
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? ",style: TextStyle(color: Colors.grey),),
                    InkWell(
                      onTap: () {
                        Get.to(LogginView());
                      },
                      child: const Text("Login",style: TextStyle(color: Colors.blue),),
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
