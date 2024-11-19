import 'package:get/get.dart';

import '../controllers/completed_task_controller.dart';

class CompletedTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompletedTaskController>(
      () => CompletedTaskController(),
    );
  }
}
