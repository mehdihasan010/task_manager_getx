import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_manager_getx/app/widgets/screen_background.dart';
import 'package:task_manager_getx/theme/app_colors.dart';

import '../controllers/forgot_password_email_controller.dart';

class ForgotPasswordEmailView extends GetView<ForgotPasswordEmailController> {
  const ForgotPasswordEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgotPasswordEmailController>();
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
                  'Your Email Address',
                  style: textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  'A 6-digit verification code will be sent to your email address',
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

  Widget _buildVerifyEmailForm(ForgotPasswordEmailController controller) {
    return Form(
      key: controller.formKey.value,
      child: Column(
        children: [
          TextFormField(
            controller: controller.emailTEController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Email'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: controller.onTapNextButton,
            child: const Icon(Icons.arrow_circle_right_outlined),
          ),
        ],
      ),
    );
  }

  Widget _buildHaveAccountSection(ForgotPasswordEmailController controller) {
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
              recognizer: TapGestureRecognizer()
                ..onTap = controller.onTapSignIn),
        ],
      ),
    );
  }
}
