import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager_getx/app/data/models/network_response.dart';
import 'package:task_manager_getx/app/data/models/user_model.dart';
import 'package:task_manager_getx/app/data/services/network_caller.dart';
import 'package:task_manager_getx/app/data/utils/urls.dart';
import 'package:task_manager_getx/app/services/auth_controller.dart';
import 'package:task_manager_getx/app/widgets/snack_bar_message.dart';

class ProfileController extends GetxController {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController firstNameTEController = TextEditingController();
  final TextEditingController lastNameTEController = TextEditingController();
  final TextEditingController phoneTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  XFile? selectedImage;

  var updateProfileInProgress = false.obs;

  @override
  void onInit() {
    super.onInit();
    setUserData();
  }

  void setUserData() {
    emailTEController.text = AuthController.userData?.email ?? '';
    firstNameTEController.text = AuthController.userData?.firstName ?? '';
    lastNameTEController.text = AuthController.userData?.lastName ?? '';
    phoneTEController.text = AuthController.userData?.mobile ?? '';
  }

  Future<void> updateProfile() async {
    updateProfileInProgress = true.obs;
    Map<String, dynamic> requestBody = {
      "email": emailTEController.text.trim(),
      "firstName": firstNameTEController.text.trim(),
      "lastName": lastNameTEController.text.trim(),
      "mobile": phoneTEController.text.trim(),
    };

    if (passwordTEController.text.isNotEmpty) {
      requestBody['password'] = passwordTEController.text;
    }

    if (selectedImage != null) {
      List<int> imageBytes = await selectedImage!.readAsBytes();
      String convertedImage = base64Encode(imageBytes);
      requestBody['photo'] = convertedImage;
    }

    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.updateProfile,
      body: requestBody,
    );

    updateProfileInProgress = false.obs;

    if (response.isSuccess) {
      UserModel userModel = UserModel.fromJson(requestBody);
      AuthController.saveUserData(userModel);
      showSnackBarMessage(Get.context!, 'Profile has been updated!');
    } else {
      showSnackBarMessage(Get.context!, response.errorMessage);
    }
  }

  String getSelectedPhotoTitle() {
    if (selectedImage != null) {
      return selectedImage!.name;
    }
    return 'Select Photo';
  }

  Future<void> pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImage = pickedImage;
    }
  }
}
