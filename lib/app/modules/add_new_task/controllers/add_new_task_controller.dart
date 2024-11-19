import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/app/data/services/network_caller.dart';
import 'package:task_manager_getx/app/data/utils/urls.dart';
import 'package:task_manager_getx/app/widgets/snack_bar_message.dart';

class AddNewTaskController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isAddingTask = false.obs;
  var shouldRefreshPreviousPage = false.obs;

  @override
  void onClose() {
    // Dispose of controllers when closing
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      addNewTask();
    }
  }

  Future<void> addNewTask() async {
    isAddingTask.value = true;

    Map<String, dynamic> requestBody = {
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
      'status': 'New',
    };

    final response = await NetworkCaller.postRequest(
      url: Urls.addNewTask,
      body: requestBody,
    );

    isAddingTask.value = false;

    if (response.isSuccess) {
      shouldRefreshPreviousPage.value = true;
      clearTextFields();
      showSnackBarMessage(Get.context!, 'New task added!');
    } else {
      showSnackBarMessage(Get.context!, response.errorMessage, true);
    }
  }

  void clearTextFields() {
    titleController.clear();
    descriptionController.clear();
  }
}
