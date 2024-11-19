import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/app/data/models/login_model.dart';
import 'package:task_manager_getx/app/data/models/network_response.dart';
import 'package:task_manager_getx/app/data/services/network_caller.dart';
import 'package:task_manager_getx/app/data/utils/urls.dart';
import 'package:task_manager_getx/app/routes/app_pages.dart';
import 'package:task_manager_getx/app/services/auth_controller.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final inProgress = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Form validation logic
  String? validateEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Enter your password';
    }
    if (value!.length <= 6) {
      return 'Enter a password more than 6 characters';
    }
    return null;
  }

  // Sign-in logic
  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    inProgress.value = true;

    Map<String, dynamic> requestBody = {
      'email': emailController.text.trim(),
      'password': passwordController.text,
    };

    final NetworkResponse response =
        await NetworkCaller.postRequest(url: Urls.login, body: requestBody);

    inProgress.value = false;

    if (response.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(response.responseData);
      await AuthController.saveAccessToken(loginModel.token!);
      await AuthController.saveUserData(loginModel.data!);

      // Navigate to main screen
      Get.offAllNamed(Routes.MAIN_BOTTOM_NAV_BAR);
    } else {
      Get.snackbar("Error", response.errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  // Navigate to forgot password screen
  void navigateToForgotPassword() {
    Get.toNamed(Routes.FORGOT_PASSWORD_EMAIL);
  }

  // Navigate to sign up screen
  void navigateToSignUp() {
    Get.toNamed(Routes.SIGN_UP);
  }
}
