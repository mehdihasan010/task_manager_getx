import 'package:get/get.dart';
import 'package:task_manager_getx/app/modules/new_task/controllers/new_task_controller.dart';

import '../../cancelled_task/controllers/cancelled_task_controller.dart';
import '../../completed_task/controllers/completed_task_controller.dart';
import '../../progress_task/controllers/progress_task_controller.dart';
import '../controllers/main_bottom_nav_bar_controller.dart';

class MainBottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainBottomNavBarController>(() => MainBottomNavBarController());
    Get.lazyPut<NewTaskController>(() => NewTaskController());
    Get.lazyPut<CompletedTaskController>(() => CompletedTaskController());
    Get.lazyPut<CancelledTaskController>(() => CancelledTaskController());
    Get.lazyPut<ProgressTaskController>(() => ProgressTaskController());
  }
}
