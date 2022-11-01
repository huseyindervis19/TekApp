import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tek_app/constance.dart';
import 'package:tek_app/core/view_model/control_view_model.dart';
import 'package:tek_app/view/auth/login_screen.dart';
import 'package:tek_app/view/cart_view.dart';
import 'package:tek_app/view/details_view.dart';
import 'package:tek_app/view/widgets/custom_text.dart';
import '../core/view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance; //// ***** delete
  final List<String> names = <String>["Man", "woman", "child", "Baby", "Small"];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<
          HomeViewModel>(), // while got other page data keep in the same page
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchTextFormField(),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: "Categories",
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewCategory(),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Best Selling",
                            fontSize: 18,
                          ),
                          CustomText(
                            text: "See all",
                            fontSize: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewProducts(),
                      Center(
                          //// ***** delete
                          child: TextButton(
                        child: Text('Logout'),
                        onPressed: () {
                          _auth.signOut();
                          Get.offAll(LoginScreen());
                        },
                      )),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade200),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(
                  text: controller.categoryModel[index].name,
                )
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 30,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetalisView(
                  model: controller.productModel[index],
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade200),
                      child: Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Image.network(
                            controller.productModel[index].image,
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.productModel[index].name,
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: CustomText(
                        text: controller.productModel[index].description,
                        color: Colors.grey,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.productModel[index].price.toString() +
                          " \$",
                      alignment: Alignment.bottomLeft,
                      color: kMainColor,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 30,
          ),
        ),
      ),
    );
  }
}
