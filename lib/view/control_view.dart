import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tek_app/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:tek_app/view/auth/login_screen.dart';
import 'package:tek_app/view/home_view.dart';

class Control_View extends GetWidget<AuthViewModel> {
  const Control_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? HomeView()
          : LoginScreen();
    });
  }
}
