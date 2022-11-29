import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tek_app/helper/extenstion.dart';

class ProductModel {
  String productId = '',
      name = '',
      image = '',
      description = '',
      sized = '',
      price = '';
  Color color = Colors.black;

  ProductModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.color,
      required this.sized,
      required this.productId});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
      'productId': productId,
    };
  }
}
