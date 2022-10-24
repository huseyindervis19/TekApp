import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tek_app/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:tek_app/view/auth/login_screen.dart';
import 'package:tek_app/view/cart_view.dart';
import 'package:tek_app/view/home_view.dart';
import 'package:tek_app/view/profile_view.dart';

import '../core/view_model/control_view_model.dart';

class Control_View extends GetWidget<AuthViewModel> {
  // const Control_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text("Explor"),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/Icon_Explore.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text("Cart"),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/Icon_Cart.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text("Account"),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/Icon_User.png',
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
