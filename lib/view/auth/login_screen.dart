import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tek_app/constance.dart';
import 'package:tek_app/core/view_model/auth_view_model.dart';
import 'package:tek_app/view/auth/register_view.dart';
import 'package:tek_app/view/widgets/custom_button.dart';
import 'package:tek_app/view/widgets/custom_button_social.dart';
import 'package:tek_app/view/widgets/custom_text.dart';
import 'package:tek_app/view/widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Welcome ,',
                    fontSize: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(RegisterView());
                    },
                    child: CustomText(
                      text: 'Sign Up',
                      color: kMainColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Sign in to Continue',
                fontSize: 14,
                color: Colors.grey,
              ),
              SizedBox(
                height: 30,
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
              CustomText(
                text: 'Forget Password ?',
                fontSize: 14,
                alignment: Alignment.bottomRight,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Sign In',
                onPressed: () {
                  _globalKey.currentState!.save();
                  if (_globalKey.currentState!.validate()) {
                    controller.sinnInWithEmailAndPassword();
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
              CustomText(
                text: '--OR--',
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                imageName: 'assets/images/facebook.png',
                text: 'Sign In With Facebook',
                onPress: () {
                  controller.facebookSignInMethod();
                },
              ),
              SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                imageName: 'assets/images/google.png',
                text: 'Sign In With Google',
                onPress: () {
                  controller.googleSignInMethod();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
