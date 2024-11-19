import 'package:get/get.dart';

import '../controllers/add_new_task_controller.dart';

class AddNewTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewTaskController>(
      () => AddNewTaskController(),
    );
  }
}
