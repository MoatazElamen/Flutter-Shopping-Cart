
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingcart/controllers/cart_controller.dart';
import 'package:shoppingcart/models/product_model.dart';
import 'package:shoppingcart/screens/cart_screen.dart';

  final List<Product> products = [
    Product(id: '1', name: 'Apple', price: 10.0, isFavorite: true , serviceProviderId:1 ,deliveryFees:5, serviceProviderName:"Fathalla" ),
    Product(id: '2', name: 'Banana', price: 30.0, isFavorite: false, serviceProviderId:1,deliveryFees:5 ,serviceProviderName:"Fathalla"),
    Product(id: '3', name: 'Pinaple', price: 10.0, isFavorite: true , serviceProviderId:1,deliveryFees:5,serviceProviderName:"Fathalla"),
    Product(id: '4', name: 'Meat', price: 30.0, isFavorite: false, serviceProviderId:2 ,deliveryFees:2 ,serviceProviderName:"BIM"),
    Product(id: '5', name: 'Carrot', price: 10.0, isFavorite: true , serviceProviderId:2 ,deliveryFees:2, serviceProviderName:"BIM"),
    Product(id: '6', name: 'Tomato', price: 30.0, isFavorite: false, serviceProviderId:2 ,deliveryFees:2, serviceProviderName:"BIM"),
    Product(id: '7', name: 'Ketchup', price: 10.0, isFavorite: true , serviceProviderId:3 ,deliveryFees:3, serviceProviderName: "Spinnes"),
    Product(id: '8', name: 'Mayo', price: 30.0, isFavorite: false, serviceProviderId:3 ,deliveryFees:3, serviceProviderName: "Spinnes"),
    Product(id: '9', name: 'Kitkat', price: 10.0, isFavorite: true , serviceProviderId:3,deliveryFees:3,serviceProviderName: "Spinnes"),
    Product(id: '10', name: 'Pepsi', price: 30.0, isFavorite: false, serviceProviderId:3,deliveryFees:3,serviceProviderName: "Spinnes"),
  ];
class HomePage extends StatelessWidget {
  HomePage({super.key});
    CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
               cartController.addToCart(product);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        
        onPressed: () {
          Get.to(() =>const CartPage());
        },
        label:Obx(() {
          return Text('Cart (${cartController.totalPrice})');
        }),
        icon: const Icon(Icons.shopping_cart),
      )
      
    );
  }
}
