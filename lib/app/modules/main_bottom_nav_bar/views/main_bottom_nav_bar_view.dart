import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_manager_getx/app/modules/cancelled_task/controllers/cancelled_task_controller.dart';
import 'package:task_manager_getx/app/modules/cancelled_task/views/cancelled_task_view.dart';
import 'package:task_manager_getx/app/modules/completed_task/controllers/completed_task_controller.dart';
import 'package:task_manager_getx/app/modules/completed_task/views/completed_task_view.dart';
import 'package:task_manager_getx/app/modules/new_task/controllers/new_task_controller.dart';
import 'package:task_manager_getx/app/modules/new_task/views/new_task_view.dart';
import 'package:task_manager_getx/app/modules/progress_task/controllers/progress_task_controller.dart';
import 'package:task_manager_getx/app/modules/progress_task/views/progress_task_view.dart';
import 'package:task_manager_getx/app/widgets/tm_app_bar.dart';

import '../controllers/main_bottom_nav_bar_controller.dart';

class MainBottomNavBarView extends GetView<MainBottomNavBarController> {
  const MainBottomNavBarView({super.key});

  final List<Widget> _screens = const [
    NewTaskView(),
    CompletedTaskView(),
    CancelledTaskView(),
    ProgressTaskView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: const TMAppBar(),
        body: _screens[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.changeIndex(index);
            switch (index) {
              case 0:
                Get.find<NewTaskController>().fetchNewTaskList();
                Get.find<NewTaskController>().fetchTaskStatusCount();
                break;
              case 1:
                Get.find<CompletedTaskController>().fetchCompletedTaskList();
                break;
              case 2:
                Get.find<CancelledTaskController>().fetchCancelledTaskList();
                break;
              case 3:
                Get.find<ProgressTaskController>().fetchProgressTaskList();
                break;
            }
          },
          items: [
            _buildBottomNavItem(Icons.new_label, 'New', 0),
            _buildBottomNavItem(Icons.check_box, 'Completed', 1),
            _buildBottomNavItem(Icons.close, 'Cancelled', 2),
            _buildBottomNavItem(Icons.access_time_outlined, 'Progress', 3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(
      IconData icon, String label, int index) {
    bool isSelected = controller.selectedIndex.value == index;
    return BottomNavigationBarItem(
      icon: isSelected
          ? Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.green
                    .withOpacity(0.2), // Background color for selected item
                shape: BoxShape.circle, // Rounded background
              ),
              child: Icon(icon, color: Colors.black), // Selected icon color
            )
          : Icon(icon, color: Colors.grey), // Unselected icon color
      label: label,
    );
  }
}
