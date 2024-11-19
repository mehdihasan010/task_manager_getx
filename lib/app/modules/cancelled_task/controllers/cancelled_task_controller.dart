import 'package:get/get.dart';
import 'package:task_manager_getx/app/data/models/task_list_model.dart';
import 'package:task_manager_getx/app/data/models/task_model.dart';
import 'package:task_manager_getx/app/data/services/network_caller.dart';
import 'package:task_manager_getx/app/data/utils/urls.dart';
import 'package:task_manager_getx/app/widgets/snack_bar_message.dart';

class CancelledTaskController extends GetxController {
  var isLoading = false.obs;
  var cancelledTaskList = <TaskModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCancelledTaskList();
  }

  Future<void> fetchCancelledTaskList() async {
    isLoading.value = true;

    final response =
        await NetworkCaller.getRequest(url: Urls.cancelledTaskList);

    if (response.isSuccess) {
      final TaskListModel taskListModel =
          TaskListModel.fromJson(response.responseData);
      cancelledTaskList.value = taskListModel.taskList ?? [];
    } else {
      showSnackBarMessage(Get.context!, response.errorMessage, true);
    }

    isLoading.value = false;
  }
}
