import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_getx/app/widgets/screen_background.dart';
import 'package:task_manager_getx/theme/app_colors.dart';

import '../controllers/forgot_password_otp_controller.dart';

class ForgotPasswordOtpView extends GetView<ForgotPasswordOtpController> {
  const ForgotPasswordOtpView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgotPasswordOtpController>();
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 82),
                Text(
                  'Pin Verification',
                  style: textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  'A 6-digit verification OTP has been sent to your email address',
                  style: textTheme.titleSmall?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                _buildVerifyEmailForm(controller),
                const SizedBox(height: 48),
                Center(
                  child: _buildHaveAccountSection(controller),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVerifyEmailForm(ForgotPasswordOtpController controller) {
    return Column(
      children: [
        PinCodeTextField(
          length: 6,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            selectedFillColor: Colors.white,
          ),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          appContext: Get.context!,
          onChanged: controller.onOtpChanged,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: controller.onTapNextButton,
          child: const Icon(Icons.arrow_circle_right_outlined),
        ),
      ],
    );
  }

  Widget _buildHaveAccountSection(ForgotPasswordOtpController controller) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0.5),
        text: "Have account? ",
        children: [
          TextSpan(
            text: 'Sign In',
            style: const TextStyle(color: AppColors.themeColor),
            recognizer: TapGestureRecognizer()..onTap = controller.onTapSignIn,
          ),
        ],
      ),
    );
  }
}
