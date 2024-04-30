import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login/app/modules/loggin/views/loggin_view.dart';
import 'package:login/app/user_detail.dart';

class RegisterController extends GetxController {
  final TextEditingController emailcon = TextEditingController();
  final TextEditingController usernamecon = TextEditingController();
  final TextEditingController passwordcon = TextEditingController();
  final TextEditingController conpasswordcon = TextEditingController();
  final buttonDisabled=true.obs;
  final usernameError=RxString('');
  final emailError = RxString('');
  final passwordError = RxString('');
  final confirmPasswordError = RxString('');

  @override
  void onInit() {
    super.onInit();
  }
  void validateUsername(String value) {
    print("object");
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
    print(buttonDisabled.value);
  }

  bool isStrongPassword(String password) {
    final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*])');
    return regex.hasMatch(password);
  }

  void registerUser() {
    print("Called");
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
      final box = GetStorage();
      box.write('user', user.toJson());
      Get.to(LogginView());
      print("User created");
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
