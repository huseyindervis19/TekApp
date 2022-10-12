import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final VoidCallback? onPress;
  const CustomButtonSocial(
      {required this.text, required this.imageName, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade100),
      child: TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Row(children: [
          Image.asset(imageName),
          SizedBox(
            width: 90,
          ),
          CustomText(
            text: text,
          )
        ]),
      ),
    );
  }
}
