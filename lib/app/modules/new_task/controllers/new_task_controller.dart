import 'package:get/get.dart';
import 'package:task_manager_getx/app/data/models/task_list_model.dart';
import 'package:task_manager_getx/app/data/models/task_model.dart';
import 'package:task_manager_getx/app/data/models/task_status_count_model.dart';
import 'package:task_manager_getx/app/data/models/task_status_model.dart';
import 'package:task_manager_getx/app/data/services/network_caller.dart';
import 'package:task_manager_getx/app/data/utils/urls.dart';
import 'package:task_manager_getx/app/widgets/snack_bar_message.dart';

class NewTaskController extends GetxController {
  var isLoadingNewTasks = false.obs;
  var isLoadingTaskStatusCount = false.obs;
  var newTaskList = <TaskModel>[].obs;
  var taskStatusCountList = <TaskStatusModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNewTaskList();
    fetchTaskStatusCount();
  }

  Future<void> fetchNewTaskList() async {
    isLoadingNewTasks.value = true;

    final response = await NetworkCaller.getRequest(url: Urls.newTaskList);

    if (response.isSuccess) {
      final TaskListModel taskListModel =
          TaskListModel.fromJson(response.responseData);
      newTaskList.value = taskListModel.taskList ?? [];
    } else {
      showSnackBarMessage(Get.context!, response.errorMessage, true);
    }

    isLoadingNewTasks.value = false;
  }

  Future<void> fetchTaskStatusCount() async {
    isLoadingTaskStatusCount.value = true;

    final response = await NetworkCaller.getRequest(url: Urls.taskStatusCount);

    if (response.isSuccess) {
      final TaskStatusCountModel taskStatusCountModel =
          TaskStatusCountModel.fromJson(response.responseData);
      taskStatusCountList.value =
          taskStatusCountModel.taskStatusCountList ?? [];
    } else {
      showSnackBarMessage(Get.context!, response.errorMessage, true);
    }

    isLoadingTaskStatusCount.value = false;
  }
}
