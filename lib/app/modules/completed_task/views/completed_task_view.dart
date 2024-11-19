import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_manager_getx/app/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager_getx/app/widgets/task_card.dart';

import '../controllers/completed_task_controller.dart';

class CompletedTaskView extends GetView<CompletedTaskController> {
  const CompletedTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CompletedTaskController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const CenteredCircularProgressIndicator();
      } else {
        return RefreshIndicator(
          onRefresh: () async => controller.fetchCompletedTaskList(),
          child: ListView.separated(
            itemCount: controller.completedTaskList.length,
            itemBuilder: (context, index) {
              return TaskCard(
                taskModel: controller.completedTaskList[index],
                onRefreshList: controller.fetchCompletedTaskList,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8),
          ),
        );
      }
    });
  }
}
