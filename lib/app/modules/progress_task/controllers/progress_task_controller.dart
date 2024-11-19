import 'package:get/get.dart';
import 'package:task_manager_getx/app/data/models/task_list_model.dart';
import 'package:task_manager_getx/app/data/models/task_model.dart';
import 'package:task_manager_getx/app/data/services/network_caller.dart';
import 'package:task_manager_getx/app/data/utils/urls.dart';
import 'package:task_manager_getx/app/widgets/snack_bar_message.dart';

class ProgressTaskController extends GetxController {
  var isLoading = false.obs;
  var progressTaskList = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProgressTaskList();
  }

  Future<void> fetchProgressTaskList() async {
    isLoading.value = true;

    final response = await NetworkCaller.getRequest(url: Urls.progressTaskList);

    if (response.isSuccess) {
      final TaskListModel taskListModel =
          TaskListModel.fromJson(response.responseData);
      progressTaskList.value = taskListModel.taskList ?? [];
    } else {
      showSnackBarMessage(Get.context!, response.errorMessage, true);
    }

    isLoading.value = false;
  }
}
