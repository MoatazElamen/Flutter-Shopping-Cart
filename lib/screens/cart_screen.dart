import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingcart/controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          GetX<CartController>(builder: (controller) {
            return Expanded(
              child: ListView.builder(
                itemCount: cartController.groupedCartItems.length,
                itemBuilder: (context, groupIndex) {
                  final group = cartController.groupedCartItems[groupIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          group.serviceProviderName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('L.E ${group.totalPrice.toStringAsFixed(2)} + Delivery Fees: ${group.deliveryFees} '),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics:const  NeverScrollableScrollPhysics(),
                        itemCount: group.cartItems.length,
                        itemBuilder: (context, index) {
                          final product = group.cartItems[index];
                          return ListTile(
                            dense: true,
                            title: Text("${product.name} - ${product.quantity}"),
                            subtitle: Text('L.E ${product.price.toStringAsFixed(2)}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.remove_shopping_cart),
                              onPressed: () {
                                cartController.removeFromCart(product);
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Perform checkout logic here
                if (kDebugMode) {
                  print(cartController.groupedCartItems);
                }
              },
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
