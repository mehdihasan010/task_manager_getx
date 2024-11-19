import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/app/data/models/network_response.dart';
import 'package:task_manager_getx/app/data/services/network_caller.dart';
import 'package:task_manager_getx/app/data/utils/urls.dart';
import 'package:task_manager_getx/app/widgets/snack_bar_message.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  var inProgress = false.obs;

  @override
  void onClose() {
    // Dispose of controllers when the controller is closed
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void onTapNextButton() {
    if (formKey.currentState!.validate()) {
      signUp();
    }
  }

  Future<void> signUp() async {
    inProgress.value = true;

    Map<String, dynamic> requestBody = {
      "email": emailController.text.trim(),
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "mobile": mobileController.text.trim(),
      "password": passwordController.text,
      "photo": ""
    };

    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.registration,
      body: requestBody,
    );

    inProgress.value = false;

    if (response.isSuccess) {
      clearTextFields();
      showSnackBarMessage(Get.context!, 'New user created');
    } else {
      showSnackBarMessage(Get.context!, response.errorMessage, true);
    }
  }

  void clearTextFields() {
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    mobileController.clear();
    passwordController.clear();
  }

  void onTapSignIn() {
    Get.back(); // Navigate back to the Sign In screen
  }
}
