import 'package:get/get.dart';
import 'package:shoppingcart/models/product_model.dart';

class CartController extends GetxController {
  RxList<GroupedCart> groupedCartItems = <GroupedCart>[].obs;
  Rx<double> totalPrice = 0.0.obs;
  addToCart(Product product) {
    totalPrice += product.price;
    var exists = groupedCartItems
        .any((group) => group.serviceProviderId == product.serviceProviderId);

    if (exists) {
      GroupedCart existingGroup = groupedCartItems.firstWhere(
          (group) => group.serviceProviderId == product.serviceProviderId);
      int productIndex = existingGroup.cartItems
          .indexWhere((element) => element.id == product.id);

      if (productIndex != -1) {
        existingGroup.cartItems[productIndex].quantity += 1;
      } else {
        existingGroup.cartItems.add(product);
      }
      existingGroup.totalPrice += product.price;
    } else {
      groupedCartItems.add(GroupedCart(
        deliveryFees: product.deliveryFees!,
        serviceProviderId: product.serviceProviderId!,
        serviceProviderName: product.serviceProviderName!,
        cartItems: [product],
        totalPrice: product.price,
      ));
    }
  }

  // Other methods...

  removeFromCart(Product product) {
        totalPrice -= product.price;
    final groupIndex = groupedCartItems.indexWhere(
        (group) => group.serviceProviderId == product.serviceProviderId);

    if (groupIndex != -1) {
      final group = groupedCartItems[groupIndex];
      if (group.cartItems
              .firstWhere((element) => element.id == product.id)
              .quantity >
          1) {
        group.cartItems
            .firstWhere((element) => element.id == product.id)
            .quantity -= 1;
      } else {
        group.cartItems.remove(product);
      }

      if (group.cartItems.isEmpty) {
        groupedCartItems.removeAt(groupIndex);
      } else {
        group.totalPrice -= product.price;
        groupedCartItems[groupIndex] = group; // Trigger UI update
      }
    }
  }

  // Other methods...
}

class GroupedCart {
  int serviceProviderId;
  String serviceProviderName;
  int deliveryFees;
  RxList<Product> cartItems;
  Rx<double> totalPrice;

  GroupedCart({
    required this.deliveryFees,
    required this.serviceProviderId,
    required this.serviceProviderName,
    required List<Product> cartItems,
    required double totalPrice,
  })  : cartItems = cartItems.obs,
        totalPrice = totalPrice.obs;
}
