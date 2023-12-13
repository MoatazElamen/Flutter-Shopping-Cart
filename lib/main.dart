import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingcart/controllers/cart_controller.dart';
import 'package:shoppingcart/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

