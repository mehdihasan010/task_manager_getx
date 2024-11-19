import 'package:get/get.dart';
import 'package:task_manager_getx/app/routes/app_pages.dart';
import 'package:task_manager_getx/app/services/auth_controller.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    // Delay for 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    await AuthController.getAccessToken();
    // Check if the user is logged in, and navigate accordingly
    if (AuthController.isLoggedIn()) {
      Get.offNamed(Routes.MAIN_BOTTOM_NAV_BAR);
    } else {
      Get.offNamed(Routes.SIGN_IN);
    }
  }
}
