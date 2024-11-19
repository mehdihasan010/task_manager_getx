import 'package:get/get.dart';

import '../controllers/progress_task_controller.dart';

class ProgressTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgressTaskController>(
      () => ProgressTaskController(),
    );
  }
}
