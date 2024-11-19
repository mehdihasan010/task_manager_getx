import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_manager_getx/app/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager_getx/app/widgets/task_card.dart';

import '../controllers/progress_task_controller.dart';

class ProgressTaskView extends GetView<ProgressTaskController> {
  const ProgressTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProgressTaskController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const CenteredCircularProgressIndicator();
      } else {
        return RefreshIndicator(
          onRefresh: () async => controller.fetchProgressTaskList(),
          child: ListView.separated(
            itemCount: controller.progressTaskList.length,
            itemBuilder: (context, index) {
              return TaskCard(
                taskModel: controller.progressTaskList[index],
                onRefreshList: controller.fetchProgressTaskList,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8),
          ),
        );
      }
    });
  }
}
