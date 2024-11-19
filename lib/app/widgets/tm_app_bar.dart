import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_getx/app/routes/app_pages.dart';
import 'package:task_manager_getx/app/services/auth_controller.dart';
import 'package:task_manager_getx/theme/app_colors.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
    this.isProfileScreenOpen = false,
  });

  final bool isProfileScreenOpen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isProfileScreenOpen) {
          return;
        }
        Get.toNamed(Routes.PROFILE);
      },
      child: AppBar(
        backgroundColor: AppColors.themeColor,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AuthController.userData?.fullName ?? '',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    AuthController.userData?.email ?? '',
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () async {
                await AuthController.clearUserData();
                Get.offAllNamed(Routes.SIGN_IN);
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
