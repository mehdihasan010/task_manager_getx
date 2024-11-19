import 'package:get/get.dart';
import 'package:task_manager_getx/app/modules/reset_password/views/reset_password_view.dart';
import 'package:task_manager_getx/app/modules/sign_in/views/sign_in_view.dart';

class ForgotPasswordOtpController extends GetxController {
  final otpCode = ''.obs;

  void onOtpChanged(String value) {
    otpCode.value = value;
  }

  void onTapNextButton() {
    if (otpCode.value.length == 6) {
      Get.to(() => const ResetPasswordView());
    } else {
      Get.snackbar(
        'Invalid OTP',
        'Please enter a 6-digit OTP code',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void onTapSignIn() {
    Get.offAll(() =>
        const SignInView()); // Clear navigation stack and go to sign in screen
  }
}
