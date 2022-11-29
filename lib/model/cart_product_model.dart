import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tek_app/helper/extenstion.dart';

class CartProductModel {
  String productId = '', name = '', image = '', price = '';
  int quantity = 0;

  CartProductModel(
      {required this.name,
      required this.image,
      required this.price,
      required this.quantity,
      required this.productId});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    print(map);
    name = map['name'];
    image = map['image'];
    price = map['price'].toString();
    quantity = int.parse(map['quantity']);
    productId = map['productId'].toString();
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId': productId,
    };
  }
}
