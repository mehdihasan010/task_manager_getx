import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_manager_getx/app/modules/add_new_task/views/add_new_task_view.dart';
import 'package:task_manager_getx/app/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager_getx/app/widgets/task_card.dart';
import 'package:task_manager_getx/app/widgets/task_summary_card.dart';

import '../controllers/new_task_controller.dart';

class NewTaskView extends GetView<NewTaskController> {
  const NewTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(NewTaskController());

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchNewTaskList();
          await controller.fetchTaskStatusCount();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSummarySection(),
            Expanded(
              child: Obx(() {
                if (controller.isLoadingNewTasks.value) {
                  return const CenteredCircularProgressIndicator();
                }
                return ListView.separated(
                  itemCount: controller.newTaskList.length,
                  itemBuilder: (context, index) {
                    return TaskCard(
                      taskModel: controller.newTaskList[index],
                      onRefreshList: () {
                        controller.fetchNewTaskList();
                        controller.fetchTaskStatusCount();
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final bool? shouldRefresh =
              await Get.to(() => const AddNewTaskView());
          if (shouldRefresh == true) {
            controller.fetchNewTaskList();
            controller.fetchTaskStatusCount();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        if (controller.isLoadingTaskStatusCount.value) {
          return const CenteredCircularProgressIndicator();
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: controller.taskStatusCountList
                .map((status) => TaskSummaryCard(
                      title: status.sId!,
                      count: status.sum ?? 0,
                    ))
                .toList(),
          ),
        );
      }),
    );
  }
}
