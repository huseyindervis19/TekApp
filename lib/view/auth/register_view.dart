import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tek_app/core/view_model/auth_view_model.dart';
import 'package:tek_app/view/auth/login_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';
import 'package:tek_app/constance.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  get kMainColor => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.off(LoginScreen());
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              CustomText(
                text: 'Sign Up',
                fontSize: 30,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFotmField(
                text: 'Name',
                hint: 'tek_app',
                onSave: (newValue) {
                  controller.name = newValue!;
                },
                validator: (newValue) {
                  if (newValue == null) {
                    print('Error');
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFotmField(
                text: 'Email',
                hint: 'tekapp.2022@gmail.com',
                onSave: (newValue) {
                  controller.email = newValue!;
                },
                validator: (newValue) {
                  if (newValue == null) {
                    print('Error');
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFotmField(
                text: 'Password',
                hint: '*********',
                onSave: (newValue) {
                  controller.password = newValue!;
                },
                validator: (value) {
                  if (value == null) {
                    print('Error');
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  _globalKey.currentState!.save();
                  if (_globalKey.currentState!.validate()) {
                    controller.createAccountWiEmailAndPassword();
                  }

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => SecondScreen(),
                  //     ));
                  // Get.to(SecondScreen());
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
