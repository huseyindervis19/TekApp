import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextFotmField extends StatelessWidget {
  final String text;
  final String? hint;
  FormFieldSetter<String>? onSave;
  FormFieldValidator<String>? validator;

  CustomTextFotmField(
      {this.hint,
      required this.text,
       this.onSave,
       this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            obscureText: hint == '*********' ? true : false,
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.black),
                fillColor: Colors.white),
          )
        ],
      ),
    );
  }
}
