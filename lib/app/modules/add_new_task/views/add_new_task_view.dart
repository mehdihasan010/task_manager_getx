import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_manager_getx/app/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager_getx/app/widgets/tm_app_bar.dart';

import '../controllers/add_new_task_controller.dart';

class AddNewTaskView extends GetView<AddNewTaskController> {
  const AddNewTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<AddNewTaskController>(
      () => AddNewTaskController(),
    );
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Pass the result back to the previous screen
        Get.back(result: controller.shouldRefreshPreviousPage.value);
        return false;
      },
      child: Scaffold(
        appBar: const TMAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 42),
                  Text(
                    'Add New Task',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: controller.titleController,
                    decoration: const InputDecoration(hintText: 'Title'),
                    validator: (value) =>
                        value?.trim().isEmpty ?? true ? 'Enter a value' : null,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: controller.descriptionController,
                    maxLines: 5,
                    decoration: const InputDecoration(hintText: 'Description'),
                    validator: (value) =>
                        value?.trim().isEmpty ?? true ? 'Enter a value' : null,
                  ),
                  const SizedBox(height: 16),
                  Obx(() => Visibility(
                        visible: !controller.isAddingTask.value,
                        replacement: const CenteredCircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: controller.onSubmit,
                          child: const Icon(Icons.arrow_circle_right_outlined),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
