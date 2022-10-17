import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tek_app/view/auth/login_screen.dart';
import 'package:tek_app/view/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  final List<String> names = <String>["s", "s", "s", "s", "s"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 100, left: 20, right: 20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomText(
            text: "Categories",
          ),
          Container(
            height: 100,
            child: ListView.builder(
              itemCount: names.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container();
              },
            ),
          )
        ],
      ),
    ));
  }
}
