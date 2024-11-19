import 'package:get/get.dart';

import '../controllers/forgot_password_email_controller.dart';

class ForgotPasswordEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordEmailController>(
      () => ForgotPasswordEmailController(),
    );
  }
}
