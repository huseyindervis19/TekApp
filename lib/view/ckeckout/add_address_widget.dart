import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tek_app/constance.dart';
import 'package:tek_app/core/view_model/checkout_viewmodel.dart';
import 'package:tek_app/view/widgets/custom_text.dart';
import 'package:tek_app/view/widgets/custom_text_form_field.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) => Form(
        key: controller.formState,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomText(
                    text: 'Address',
                    fontSize: 15,
                    alignment: Alignment.center,
                    color: kMainColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Billing address is the same as delivery address ',
                    fontSize: 20,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFotmField(
                    text: 'Street 1',
                    hint: 'KULTUR MAH',
                    onSave: (String? newValue) {
                      controller.street1 = newValue!;
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'you must write your street';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFotmField(
                    text: 'Street 2',
                    hint: '4205 CAD . NO: 10 / 12',
                    onSave: (String? newValue) {
                      controller.street2 = newValue!;
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'you must write your street 2';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFotmField(
                    text: 'City',
                    hint: 'Elazig',
                    onSave: (String? newValue) {
                      controller.city = newValue!;
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'you must write your city';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: CustomTextFotmField(
                              text: 'State',
                              hint: 'Lagos State',
                              onSave: (String? newValue) {
                                controller.state = newValue!;
                              },
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'you must write your State';
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CustomTextFotmField(
                              text: 'Country',
                              hint: 'Nigeria',
                              onSave: (String? newValue) {
                                controller.country = newValue!;
                              },
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'you must write your Country';
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
