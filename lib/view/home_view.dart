import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tek_app/constance.dart';
import 'package:tek_app/view/auth/login_screen.dart';
import 'package:tek_app/view/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance; //// ***** delete
  final List<String> names = <String>["Man", "woman", "child", "Baby", "Small"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            children: [
              _searchTextFormField(),
              SizedBox(
                height: 50,
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
        ));
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
    return Container(
      height: 100,
      child: ListView.separated(
        itemCount: names.length,
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
                  child: Image.asset('assets/images/poloShirt.png'),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                text: names[index],
              )
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 30,
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return Container(
      height: 350,
      child: ListView.separated(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
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
                      child: Image.asset(
                        'assets/images/coat.jpg',
                        fit: BoxFit.fill,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "BeoPlay Speaker",
                  alignment: Alignment.bottomLeft,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Bang and Olufsen",
                  color: Colors.grey,
                  alignment: Alignment.bottomLeft,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "\$250",
                  alignment: Alignment.bottomLeft,
                  color: kMainColor,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 30,
        ),
      ),
    );
  }
}
