import 'package:get/get.dart';

import '../controllers/cancelled_task_controller.dart';

class CancelledTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CancelledTaskController>(
      () => CancelledTaskController(),
    );
  }
}
