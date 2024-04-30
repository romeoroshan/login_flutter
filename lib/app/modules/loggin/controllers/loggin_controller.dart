import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login/app/modules/loggin/views/home_view.dart';
import 'package:login/app/user_detail.dart';

class LogginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final emailError = RxString('');
  final passwordError = RxString('');
  final buttonDisabled = true.obs;

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

  void updateButtonState() {
    buttonDisabled.value = emailError.isNotEmpty || passwordError.isNotEmpty;
    print(buttonDisabled.value);
  }

  bool isStrongPassword(String password) {
    final regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*])');
    return regex.hasMatch(password);
  }

  void getUserData() {
    final box = GetStorage();
    final userData = box.read('user');
    print(userData);
    if (userData != null) {
      final user = User.fromJson(userData);
      if (user.email == emailController.text &&
          user.password == passwordController.text) {
        Get.to(HomeView(name: user.username));
      } else {
        Get.snackbar(
                              'Error',
                              'Invalid User',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
      }
    } else {
      print("no user found");
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
