import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_manager_getx/app/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager_getx/app/widgets/screen_background.dart';
import 'package:task_manager_getx/theme/app_colors.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
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
                  'Get Started With',
                  style: textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 24),
                _buildSignInForm(controller),
                const SizedBox(height: 24),
                Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: controller.navigateToForgotPassword,
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      _buildSignUpSection(controller),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInForm(SignInController controller) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Email'),
            validator: controller.validateEmail,
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.passwordController,
            obscureText: true,
            decoration: const InputDecoration(hintText: 'Password'),
            validator: controller.validatePassword,
          ),
          const SizedBox(height: 24),
          Obx(() => Visibility(
                visible: !controller.inProgress.value,
                replacement: const CenteredCircularProgressIndicator(),
                child: ElevatedButton(
                  onPressed: controller.signIn,
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildSignUpSection(SignInController controller) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0.5),
        text: "Don't have an account? ",
        children: [
          TextSpan(
              text: 'Sign Up',
              style: const TextStyle(color: AppColors.themeColor),
              recognizer: TapGestureRecognizer()
                ..onTap = controller.navigateToSignUp),
        ],
      ),
    );
  }
}
