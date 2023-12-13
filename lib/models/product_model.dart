class Product {
  final String id;
  final String name;
  final double price;
  int quantity;
  bool? isFavorite;
  int? serviceProviderId;
  String? serviceProviderName;
  
  int? deliveryFees;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      this.quantity = 1,
      this.isFavorite,
      this.serviceProviderId,
      this.deliveryFees,
      this.serviceProviderName});

  toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'isFavorite': isFavorite ?? false,
    };
  }
}

class ServiceProvider {
  final String id;
  final String name;
  List<Product> products;
  ServiceProvider(
      {required this.id, required this.products, required this.name});
}
