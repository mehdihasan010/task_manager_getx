// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/add_new_task/bindings/add_new_task_binding.dart';
import '../modules/add_new_task/views/add_new_task_view.dart';
import '../modules/cancelled_task/bindings/cancelled_task_binding.dart';
import '../modules/cancelled_task/views/cancelled_task_view.dart';
import '../modules/completed_task/bindings/completed_task_binding.dart';
import '../modules/completed_task/views/completed_task_view.dart';
import '../modules/forgot_password_email/bindings/forgot_password_email_binding.dart';
import '../modules/forgot_password_email/views/forgot_password_email_view.dart';
import '../modules/forgot_password_otp/bindings/forgot_password_otp_binding.dart';
import '../modules/forgot_password_otp/views/forgot_password_otp_view.dart';
import '../modules/main_bottom_nav_bar/bindings/main_bottom_nav_bar_binding.dart';
import '../modules/main_bottom_nav_bar/views/main_bottom_nav_bar_view.dart';
import '../modules/new_task/bindings/new_task_binding.dart';
import '../modules/new_task/views/new_task_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/progress_task/bindings/progress_task_binding.dart';
import '../modules/progress_task/views/progress_task_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.ADD_NEW_TASK,
      page: () => const AddNewTaskView(),
      binding: AddNewTaskBinding(),
    ),
    GetPage(
      name: _Paths.CANCELLED_TASK,
      page: () => const CancelledTaskView(),
      binding: CancelledTaskBinding(),
    ),
    GetPage(
      name: _Paths.COMPLETED_TASK,
      page: () => const CompletedTaskView(),
      binding: CompletedTaskBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_EMAIL,
      page: () => const ForgotPasswordEmailView(),
      binding: ForgotPasswordEmailBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_OTP,
      page: () => const ForgotPasswordOtpView(),
      binding: ForgotPasswordOtpBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_BOTTOM_NAV_BAR,
      page: () => const MainBottomNavBarView(),
      binding: MainBottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.NEW_TASK,
      page: () => const NewTaskView(),
      binding: NewTaskBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PROGRESS_TASK,
      page: () => const ProgressTaskView(),
      binding: ProgressTaskBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
