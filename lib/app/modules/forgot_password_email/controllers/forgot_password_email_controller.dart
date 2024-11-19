import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/app/data/models/network_response.dart';
import 'package:task_manager_getx/app/data/services/network_caller.dart';
import 'package:task_manager_getx/app/data/utils/urls.dart';
import 'package:task_manager_getx/app/modules/forgot_password_otp/views/forgot_password_otp_view.dart';

class ForgotPasswordEmailController extends GetxController {
  final emailTEController = TextEditingController();
  final formKey = GlobalKey<FormState>().obs;

  void onTapNextButton() {
    if (!formKey.value.currentState!.validate()) {
      return;
    }
    _recoverVerifyEmail(emailTEController.text.trim());
  }

  void onTapSignIn() {
    Get.back(); // GetX replacement for Navigator.pop
  }

  Future<void> _recoverVerifyEmail(String email) async {
    NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.recoverVerifyEmail + email);

    if (response.isSuccess) {
      Get.snackbar('Success', response.responseData["data"] + email,
          snackPosition: SnackPosition.BOTTOM);
      Get.to(() => const ForgotPasswordOtpView()); // Navigation with GetX
    } else {
      Get.snackbar('Error', response.errorMessage,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    emailTEController.dispose(); // Dispose controller to free resources
    super.onClose();
  }
}
