import 'package:get/get.dart';
import 'package:task_manager_getx/app/data/models/task_list_model.dart';
import 'package:task_manager_getx/app/data/models/task_model.dart';
import 'package:task_manager_getx/app/data/services/network_caller.dart';
import 'package:task_manager_getx/app/data/utils/urls.dart';
import 'package:task_manager_getx/app/widgets/snack_bar_message.dart';

class CompletedTaskController extends GetxController {
  var isLoading = false.obs;
  var completedTaskList = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCompletedTaskList();
  }

  Future<void> fetchCompletedTaskList() async {
    isLoading.value = true;

    final response =
        await NetworkCaller.getRequest(url: Urls.completedTaskList);

    if (response.isSuccess) {
      final TaskListModel taskListModel =
          TaskListModel.fromJson(response.responseData);
      completedTaskList.value = taskListModel.taskList ?? [];
    } else {
      showSnackBarMessage(Get.context!, response.errorMessage, true);
    }

    isLoading.value = false;
  }
}
