import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_manager_getx/app/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager_getx/app/widgets/task_card.dart';

import '../controllers/cancelled_task_controller.dart';

class CancelledTaskView extends GetView<CancelledTaskController> {
  const CancelledTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CancelledTaskController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const CenteredCircularProgressIndicator();
      } else {
        return RefreshIndicator(
          onRefresh: () async => controller.fetchCancelledTaskList(),
          child: ListView.separated(
            itemCount: controller.cancelledTaskList.length,
            itemBuilder: (context, index) {
              return TaskCard(
                taskModel: controller.cancelledTaskList[index],
                onRefreshList: controller.fetchCancelledTaskList,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8),
          ),
        );
      }
    });
  }
}
