import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_manager_getx/app/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager_getx/app/widgets/screen_background.dart';
import 'package:task_manager_getx/theme/app_colors.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
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
                  'Join With Us',
                  style: textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 24),
                _buildSignUpForm(),
                const SizedBox(height: 24),
                Center(
                  child: _buildHaveAccountSection(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(hintText: 'Email'),
            validator: (value) =>
                value?.isEmpty ?? true ? 'Enter valid email' : null,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller.firstNameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(hintText: 'First name'),
            validator: (value) =>
                value?.isEmpty ?? true ? 'Enter first name' : null,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller.lastNameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(hintText: 'Last name'),
            validator: (value) =>
                value?.isEmpty ?? true ? 'Enter last name' : null,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller.mobileController,
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(hintText: 'Mobile'),
            validator: (value) =>
                value?.isEmpty ?? true ? 'Enter mobile no' : null,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller.passwordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(hintText: 'Password'),
            validator: (value) =>
                value?.isEmpty ?? true ? 'Enter your password' : null,
          ),
          const SizedBox(height: 24),
          Obx(() => Visibility(
                visible: !controller.inProgress.value,
                replacement: const CenteredCircularProgressIndicator(),
                child: ElevatedButton(
                  onPressed: controller.onTapNextButton,
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildHaveAccountSection() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0.5),
        text: "Have an account? ",
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
