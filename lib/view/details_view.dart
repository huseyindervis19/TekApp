import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tek_app/constance.dart';
import 'package:tek_app/core/view_model/cart_viewmodel.dart';
import 'package:tek_app/model/cart_product_model.dart';
import 'package:tek_app/model/product_model.dart';
import 'package:tek_app/view/widgets/custom_button.dart';
import 'package:tek_app/view/widgets/custom_text.dart';

class DetalisView extends StatelessWidget {
  ProductModel model;

  DetalisView({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 270,
            child: Image.network(model.image, fit: BoxFit.fill),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    CustomText(
                      text: model.name,
                      fontSize: 26,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16),
                                width: MediaQuery.of(context).size.width * .4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomText(
                                      text: 'Size',
                                    ),
                                    CustomText(
                                      text: model.sized,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16),
                                width: MediaQuery.of(context).size.width * .44,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomText(
                                      text: 'Color',
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: model.color),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: 'Detalis',
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: model.description,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: 'PRICE',
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    CustomText(
                      text: "\$" + model.price,
                      color: kMainColor,
                      fontSize: 18,
                    ),
                  ],
                ),
                GetBuilder<CartViewModel>(
                  init: Get.put(CartViewModel()),
                  builder: (controller) => Container(
                    padding: EdgeInsets.all(20),
                    width: 180,
                    height: 100,
                    child: CustomButton(
                      onPressed: () {
                        controller.addProduct(
                          CartProductModel(
                              name: model.name,
                              image: model.image,
                              price: model.price,
                              quantity: 1,
                              productId: model.productId),
                        );
                        getTest(model.name);
                      },
                      text: 'Add',
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  getTest(String name) {
    Get.snackbar('successfully added', name + ' ',
        icon: Icon(Icons.production_quantity_limits_outlined,
            color: Colors.black),
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP);
  }
}
